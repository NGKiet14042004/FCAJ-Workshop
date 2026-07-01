---
title : "Tạo User Pool"
date : 2024-01-01 
weight : 1
chapter : false
pre : " <b> 5.3.1 </b> "
---

#### Tạo Amazon Cognito User Pool

User Pool là nơi lưu trữ tài khoản người dùng và cấu hình quy tắc đăng nhập/đăng ký cho ZeroBug Agent. Giao diện Cognito mới dùng luồng tạo nhanh **"Define your application"** — gộp việc tạo User Pool và App Client vào cùng một trang.

{{% notice note %}}
Từ bước này trở đi, hãy thao tác bằng IAM User `zerobug-admin` đã tạo ở 5.2, và đảm bảo Region là **ap-southeast-1 (Singapore)**.
{{% /notice %}}

**Bước 1 – Mở Amazon Cognito Console**

1. Đăng nhập [AWS Management Console](https://console.aws.amazon.com/).
2. Tìm kiếm **Cognito** → mở dịch vụ.
3. Menu trái → **User pools** → nhấn **Create user pool**.

![Mở Cognito Console](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.1/1.png)
![Tạo User Pool](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.1/2.png)

**Bước 2 – Define your application**

1. **Application type**: chọn **Single-page application (SPA)**.
   - Vì front-end ZeroBug Agent là Vite SPA → đây chính là **Public client** (không có Client Secret).
2. **Name your application**: nhập `zerobug-agent-spa`.
3. **Options for sign-in identifiers**: tích **Email** (bỏ Phone number và Username).
4. **Self-registration**: để **Enable self-registration** được tích sẵn.
5. **Required attributes for sign-up**: chọn **email** (thêm **name** nếu cần).

{{% notice warning %}}
Cảnh báo của Cognito: *"Options for sign-in identifiers and required attributes can't be changed after the app has been created."* → Hãy chọn **Email** và required attributes cho đúng ngay, vì sau khi tạo **không sửa được** (phải tạo lại User Pool).
{{% /notice %}}

![Define your application](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.1/3.png)

**Bước 3 – Add a return URL**

1. **Return URL**: nhập `http://localhost:5173/callback` (môi trường dev của Vite).
2. Nhấn **Create user directory**.

{{% notice tip %}}
Nếu ô Return URL báo lỗi *"Return URL contains invalid characters"*, thường do field đã có sẵn `https://` rồi bạn gõ thêm vào (thành `https://http://...`), hoặc dính dấu cách thừa. Hãy **xóa sạch ô** rồi gõ lại đúng `http://localhost:5173/callback`. Cognito cho phép `http://localhost` để test.
{{% /notice %}}

![Add a return URL](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.1/4.png)

**Bước 4 – Đặt tên User Pool (tùy chọn)**

Cognito tạo User Pool với tên ngẫu nhiên. Vào **Overview** → **Rename** để đổi thành `zerobug-agent-user-pool` cho dễ nhận biết.

![Rename](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.1/5.png)

**Bước 5 – Ghi lại các thông tin quan trọng**

Mở User Pool vừa tạo và ghi lại các giá trị sau (dùng cho 5.4 và 5.5):

| Thông tin | Nơi lấy | Ví dụ (của workshop này) |
| --- | --- | --- |
| **User Pool ID** | Overview → **User pool ID** | `ap-southeast-1_GevSgtD8j` |
| **App Client ID** | **App clients** → `zerobug-agent-spa` → Client ID | `4kmjdov040cmrulog2fmmcgnr7` |
| **Token signing key URL (JWKS)** | Overview → **Token signing key URL** | `https://cognito-idp.ap-southeast-1.amazonaws.com/ap-southeast-1_GevSgtD8j/.well-known/jwks.json` |


{{% notice note %}}
**User Pool ID** sẽ được dùng khi tạo Cognito Authorizer trong API Gateway (bước 5.4.3) và khi lấy/đặt mật khẩu bằng AWS CLI (bước 5.3.3, 5.5).
{{% /notice %}}