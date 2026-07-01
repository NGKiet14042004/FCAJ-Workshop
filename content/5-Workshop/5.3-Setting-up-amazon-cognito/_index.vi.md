---
title : "Thiết lập Amazon Cognito"
date : 2024-01-01
weight : 3
chapter : false
pre : " <b> 5.3. </b> "
---

{{% notice note %}}
Hãy đăng nhập vào tài khoản **IAM User** đã tạo trước đó để thực hiện các bước tiếp theo.
{{% /notice %}}

#### Tổng quan

**Amazon Cognito User Pool** là dịch vụ quản lý danh tính người dùng, chịu trách nhiệm:

- Đăng ký và xác minh email người dùng.
- Xác thực (Authentication) và cấp JWT Token (IdToken, AccessToken, RefreshToken).
- Quản lý vòng đời tài khoản và đặt lại mật khẩu.

Trong phần này, bạn sẽ tạo User Pool, cấu hình App Client phù hợp cho Vite SPA (Public client / SPA), và tạo tài khoản người dùng test đầu tiên.

#### Nội dung

- [Tạo User Pool](5.3.1-create-gwe/)
- [Cấu hình App Client](5.3.2-test-gwe/)
- [Tạo tài khoản người dùng test](5.3.3-create-user/)
