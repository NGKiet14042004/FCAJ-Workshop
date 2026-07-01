---
title : "Kiểm tra luồng xác thực"
date : 2024-01-01
weight : 5
chapter : false
pre : " <b> 5.5. </b> "
---

Sau khi hoàn thành Cognito User Pool, App Client và Cognito Authorizer trên API Gateway, ta kiểm tra toàn bộ luồng xác thực: lấy JWT Token, gọi API có/không có token, và làm mới token.

{{% notice note %}}
Các lệnh `aws` và cú pháp biến `$token` ở phần này chạy trong **PowerShell** (dấu nhắc `PS C:\...>`). Nếu đang ở Command Prompt (`C:\...>`), gõ `powershell` rồi Enter để chuyển sang PowerShell.
{{% /notice %}}

---

### 5.5.1. Đăng nhập và nhận JWT Token

Dùng AWS CLI với flow `USER_PASSWORD_AUTH` (đã bật ở bước 5.3.2) để lấy token và lưu vào biến `$token`:

```powershell
$token = (aws cognito-idp initiate-auth --auth-flow USER_PASSWORD_AUTH --client-id 4kmjdov040cmrulog2fmmcgnr7 --auth-parameters USERNAME=admin@gmail.com,PASSWORD=Admin@12345 --region ap-southeast-1 --no-cli-pager | ConvertFrom-Json).AuthenticationResult.IdToken
```

```
echo $token
```

**Kết quả mong đợi:** lệnh in ra chuỗi **IdToken** (3 phần ngăn bởi dấu `.`). Response gốc của Cognito còn gồm `AccessToken`, `RefreshToken`, `ExpiresIn: 3600` (token sống 1 giờ).

{{% notice note %}}
Cognito Authorizer của REST API mặc định xác thực bằng **IdToken**. Vì vậy ta lấy `IdToken` (không phải `AccessToken`) cho các bước gọi API tiếp theo.
{{% /notice %}}

Lưu thêm Refresh Token để dùng ở 5.5.3:

```powershell
$refresh = (aws cognito-idp initiate-auth --auth-flow USER_PASSWORD_AUTH --client-id 4kmjdov040cmrulog2fmmcgnr7 --auth-parameters USERNAME=admin@gmail.com,PASSWORD=Admin@12345 --region ap-southeast-1 --no-cli-pager | ConvertFrom-Json).AuthenticationResult.RefreshToken
```

![Lấy JWT Token](/images/5-Workshop/5.5-Testing-the-authentication-flow/1.png)

---

### 5.5.2. Gọi API có bảo vệ với Bearer Token

#### Cách 1 – Dùng curl trong PowerShell

**Gọi KHÔNG có token (kỳ vọng 401):**

```powershell
curl.exe -i https://59d9m03f78.execute-api.ap-southeast-1.amazonaws.com/prod/projects
```

Kết quả: `HTTP/1.1 401 Unauthorized`, body `{"message":"Unauthorized"}`.

**Gọi KÈM token (kỳ vọng 200):**

```powershell
curl.exe -i -H "Authorization: $token" https://59d9m03f78.execute-api.ap-southeast-1.amazonaws.com/prod/projects
```

Kết quả: `HTTP/1.1 200 OK`.

#### Cách 2 – Dùng Postman

**Trường hợp không có token (401):**

1. Tạo request **GET** tới `https://sb9qx62pe9.execute-api.ap-southeast-1.amazonaws.com/prod/projects`.
2. Tab **Authorization**: để **No Auth** → **Send**.
3. Kết quả: **Status 401 Unauthorized**, body `{"message":"Unauthorized"}`.

![Gọi không token - 401](/images/5-Workshop/5.5-Testing-the-authentication-flow/2.png)

**Trường hợp có token hợp lệ (200):**

1. Trong cùng request, tab **Authorization** → **Auth Type**: **Bearer Token** → dán chuỗi IdToken (lấy từ `echo $token`).
2. Nhấn **Send**.
3. Kết quả: **Status 200 OK**.

![Gọi có token - 200](/images/5-Workshop/5.5-Testing-the-authentication-flow/3.png)

{{% notice warning %}}
Với REST API + Cognito Authorizer, header `Authorization` nhận **chuỗi token thuần**, không cần tiền tố `Bearer `. Nếu tự thêm ở tab **Headers** (Cách 2 nâng cao), chỉ dán token; nếu dùng **Bearer Token**, Postman tự thêm "Bearer " và API Gateway vẫn lấy đúng phần token phía sau.
{{% /notice %}}

{{% notice note %}}
So sánh kết quả:
- **Không token** → `401 Unauthorized` (bị Cognito Authorizer chặn, chưa vào backend).
- **Token hợp lệ** → `200 OK` (qua xác thực).

Đây là minh chứng luồng xác thực JWT hoạt động đúng.
{{% /notice %}}

---

### 5.5.3. Kiểm tra token hết hạn và Refresh Token

#### Xem nội dung & hạn token

IdToken sống 1 giờ. Mở [jwt.io](https://jwt.io) và dán token để xem payload:

```json
{
  "iss": "https://cognito-idp.ap-southeast-1.amazonaws.com/ap-southeast-1_GevSgtD8j",
  "aud": "4kmjdov040cmrulog2fmmcgnr7",
  "token_use": "id",
  "email": "admin@gmail.com",
  "email_verified": true,
  "iat": 1782726059,
  "exp": 1782729659
}
```

Kiểm chứng: `exp - iat = 3600 giây = 1 giờ` → khớp `ExpiresIn`. Sau thời điểm `exp`, token bị từ chối (`401`).

{{% notice note %}}
API Gateway tin token vì: chữ ký hợp lệ (theo JWKS của pool), `iss` đúng User Pool, `aud` đúng App Client, `token_use = id`, và `exp` chưa quá hạn. Sai bất kỳ điều nào → `401`.
{{% /notice %}}

![Decode token tại jwt.io](/images/5-Workshop/5.5-Testing-the-authentication-flow/6.png)

#### Mô phỏng token hết hạn / không hợp lệ

Không cần chờ 1 giờ, bạn có thể sửa 1 ký tự trong token (làm token không hợp lệ) rồi gọi lại → trả **401**, minh họa việc API Gateway từ chối token sai/hết hạn.

```powershell
curl.exe -i -H "Authorization: tokenSai123" https://sb9qx62pe9.execute-api.ap-southeast-1.amazonaws.com/prod/projects
```

#### Dùng Refresh Token lấy IdToken mới

Khi token hết hạn, dùng Refresh Token để lấy token mới mà không cần đăng nhập lại:

```powershell
$new = (aws cognito-idp initiate-auth --auth-flow REFRESH_TOKEN_AUTH --client-id 4kmjdov040cmrulog2fmmcgnr7 --auth-parameters REFRESH_TOKEN=$refresh --region ap-southeast-1 --no-cli-pager | ConvertFrom-Json).AuthenticationResult.IdToken
```

```
echo $new
```

Sau đó gọi lại API bằng token mới (Postman hoặc curl) → **200 OK**.

![Refresh Token thành công](/images/5-Workshop/5.5-Testing-the-authentication-flow/4.png)
![Refresh Token thành công](/images/5-Workshop/5.5-Testing-the-authentication-flow/5.png)

{{% notice note %}}
Luồng hoàn chỉnh: **Login → IdToken (1h)** → khi hết hạn → **dùng RefreshToken → IdToken mới** (không cần nhập lại mật khẩu). Trong Vite SPA thường dùng thư viện `amazon-cognito-identity-js` để tự động làm mới token.
{{% /notice %}}
