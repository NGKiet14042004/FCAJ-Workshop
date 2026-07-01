---
title : "Cấu hình App Client"
date : 2024-01-01 
weight : 2
chapter : false
pre : " <b> 5.3.2 </b> "
---

#### Cấu hình App Client (Public client / SPA — không cần Client Secret)

App Client đại diện cho ứng dụng front-end khi tương tác với Cognito User Pool. Ở bước 5.3.1, App Client `zerobug-agent-spa` đã được tạo tự động theo kiểu **Single-page application (Public client)**. Bước này kiểm tra và hoàn thiện cấu hình.

**Bước 1 – Mở App Client**

1. Trong User Pool `zerobug-agent-user-pool` → menu trái **App clients**.
2. Click vào `zerobug-agent-spa`.

![Mở App Client](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.2/1.png)

**Bước 2 – Xác nhận không có Client Secret**

Vì là Public client (SPA), App Client **không** có Client Secret — đúng yêu cầu cho Vite SPA (source code chạy trên trình duyệt, không thể giữ secret an toàn). Kiểm tra dòng **Client secret** hiển thị *Not generated*.

![Không có Client Secret](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.2/2.png)

**Bước 3 – Cấu hình Login pages (Hosted UI / OAuth)**

1. Trong App Client → khu **Login pages** → nhấn **Edit**.
2. Kiểm tra / điền:
   - **Allowed callback URLs**: `http://localhost:5173/callback`
   - **Allowed sign-out URLs**: `http://localhost:5173`
   - **Identity providers**: **Cognito user pool**
   - **OAuth 2.0 grant types**: tích **Authorization code grant**
   - **OpenID Connect scopes**: tích **openid**, **email**, **profile**
3. Nhấn **Save changes**.

![Cấu hình OAuth](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.2/3.png)
![Cấu hình OAuth](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.2/4.png)
![Cấu hình OAuth](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.2/5.png)

**Bước 4 – Bật Authentication flow để test**

Để có thể lấy token bằng AWS CLI/Postman ở bước 5.5, cần bật flow đăng nhập bằng username/password:

1. Trong App Client → khu **Authentication flows** → **Edit**.
2. Tích thêm **ALLOW_USER_PASSWORD_AUTH**.
3. Giữ **ALLOW_REFRESH_TOKEN_AUTH** (dùng cho Refresh Token ở 5.5.3).
4. Nhấn **Save changes**.

{{% notice warning %}}
**Không bật** `ALLOW_ADMIN_USER_PASSWORD_AUTH` cho public client — flow này dành cho server-side và yêu cầu Client Secret.
{{% /notice %}}

![Authentication flows](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.2/6.png)
![Authentication flows](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.2/7.png)

**Bước 5 – Ghi lại App Client ID**

App Client ID dùng để cấu hình cho Vite SPA và để lấy token bằng CLI:

```env
VITE_COGNITO_USER_POOL_ID=ap-southeast-1_GevSgtD8j
VITE_COGNITO_CLIENT_ID=4kmjdov040cmrulog2fmmcgnr7
VITE_COGNITO_REGION=ap-southeast-1
```

![App Client ID](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.2/8.png)
