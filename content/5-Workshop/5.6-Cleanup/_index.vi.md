---
title : "Dọn dẹp tài nguyên"
date : 2024-01-01
weight : 6
chapter : false
pre : " <b> 5.6. </b> "
---

Chúc mừng bạn đã hoàn thành Workshop thiết lập xác thực và ủy quyền cho ZeroBug Agent với Amazon Cognito và API Gateway!

Trong workshop này, bạn đã:
- Tạo IAM User và cấp quyền bằng AWS Managed Policies.
- Tạo Amazon Cognito User Pool và App Client (Public client / SPA).
- Tạo tài khoản test `admin@gmail.com` và đặt mật khẩu vĩnh viễn.
- Xây dựng REST API với resource `/auth`, `/projects`, `/aws`, Cognito Authorizer và CORS, deploy stage `prod`.
- Kiểm chứng luồng xác thực: `401` khi thiếu token, `200` khi token hợp lệ, và làm mới bằng Refresh Token.

Dọn dẹp theo thứ tự sau để tránh phụ thuộc:

---

#### 1. Xóa API Gateway

1. Mở [API Gateway Console](https://console.aws.amazon.com/apigateway/).
2. Chọn API `zerobug-agent-api`.
3. Vào **API settings** (hoặc menu **Actions**) → **Delete API**.
4. Gõ xác nhận → **Delete**.

![Xóa API Gateway](/images/5-Workshop/5.6-Cleanup/1.png)
![Xóa API Gateway](/images/5-Workshop/5.6-Cleanup/2.png)

---

#### 2. Xóa Amazon Cognito User Pool

1. Mở [Cognito Console](https://console.aws.amazon.com/cognito/) → **User pools** → `zerobug-agent-user-pool`.
2. **Xóa Domain trước** (bắt buộc, nếu không sẽ chặn xóa pool): menu **Domain** (hoặc **Branding → Domain**) → **Delete Cognito domain**.
3. Quay ra → **Delete user pool** → gõ tên để xác nhận → **Delete**.

{{% notice warning %}}
Xóa User Pool sẽ **xóa vĩnh viễn** toàn bộ tài khoản người dùng trong Pool. Đảm bảo không còn cần dữ liệu trước khi xóa.
{{% /notice %}}

![Xóa Cognito User Pool](/images/5-Workshop/5.6-Cleanup/3.png)
![Xóa Cognito User Pool](/images/5-Workshop/5.6-Cleanup/4.png)
![Xóa Cognito User Pool](/images/5-Workshop/5.6-Cleanup/5.png)
![Xóa Cognito User Pool](/images/5-Workshop/5.6-Cleanup/6.png)

---

#### 3. Vô hiệu hóa và xóa Access Key

Access Key đã tạo ở bước 5.2 không còn cần thiết — nên xóa để tránh rủi ro bảo mật:

1. Mở [IAM Console](https://console.aws.amazon.com/iam/) → **Users** → `zerobug-admin` → tab **Security credentials**.
2. Mục **Access keys** → chọn key đã tạo → **Actions** → **Deactivate** → rồi **Delete**.

![Xóa Access Key](/images/5-Workshop/5.6-Cleanup/7.png)

---

#### 4. (Tùy chọn) Xóa IAM User

Nếu không dùng nữa, có thể xóa luôn IAM User:

1. **IAM** → **Users** → `zerobug-admin` → **Delete**.
2. Gõ tên user để xác nhận.

![Xóa IAM User](/images/5-Workshop/5.6-Cleanup/8.png)
![Xóa IAM User](/images/5-Workshop/5.6-Cleanup/9.png)

---

#### 5. Xác nhận không còn tài nguyên phát sinh phí

Kiểm tra lại trong **AWS Billing / Cost Explorer** để đảm bảo không còn tài nguyên nào tiếp tục tạo chi phí. Cognito có 50.000 người dùng active miễn phí mỗi tháng, nhưng vẫn nên xóa khi không dùng để giữ tài khoản gọn gàng.