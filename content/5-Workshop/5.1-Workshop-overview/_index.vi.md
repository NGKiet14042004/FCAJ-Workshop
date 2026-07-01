---
title : "Giới thiệu"
date : 2024-01-01 
weight : 1 
chapter : false
pre : " <b> 5.1. </b> "
---

#### Tổng quan về xác thực và ủy quyền trong ZeroBug Agent

**ZeroBug Agent** là một nền tảng web + desktop, do đó việc bảo vệ tất cả các API khỏi truy cập trái phép là yêu cầu bắt buộc. Hệ thống áp dụng mô hình xác thực dựa trên **JSON Web Token (JWT)** kết hợp giữa **Amazon Cognito User Pool** (cấp token) và **Amazon API Gateway** với **Cognito Authorizer** (kiểm tra token).

Trong workshop này, bạn sẽ tự tay thiết lập toàn bộ luồng xác thực: tạo User Pool, cấu hình App Client cho Vite SPA, bảo vệ REST API bằng Cognito Authorizer, rồi kiểm chứng bằng cách lấy JWT Token và gọi thử API.

#### Luồng xác thực chính

```
[Vite SPA / Electron Desktop Client]
        │
        │  1. Đăng nhập (username + password) qua Amazon Cognito
        ▼
[Amazon Cognito – User Pool]
        │
        │  2. Trả về: IdToken, AccessToken, RefreshToken
        ▼
[Front-end lưu token]
        │
        │  3. Gọi API kèm header: Authorization: <IdToken>
        ▼
[Amazon API Gateway – REST API + Cognito Authorizer]
        │
        │  4. Authorizer xác thực token với Cognito User Pool (JWKS)
        ▼
[Application Load Balancer – Public Subnet]
        │
        ▼
[Amazon EC2 – Spring Boot Backend – Private Subnet]
        │
        ▼
[Kết quả trả về cho Client]
```

{{% notice note %}}
Với **REST API + Cognito Authorizer**, token được gắn **trực tiếp** vào header `Authorization` (giá trị là chuỗi token thuần, **không** cần tiền tố `Bearer `). Đây là điểm khác biệt quan trọng so với HTTP API JWT Authorizer.
{{% /notice %}}

#### Các thành phần tham gia

| Thành phần | Vai trò |
| --- | --- |
| **Amazon Cognito User Pool** | Quản lý tài khoản người dùng, cấp JWT Token, xác thực email |
| **App Client (Cognito)** | Cấu hình cho Vite SPA — kiểu **Public client / SPA** (không cần Client Secret) |
| **Amazon API Gateway** | Cổng REST API công khai; gắn Cognito Authorizer bảo vệ các route |
| **Cognito Authorizer** | Tự động xác thực token với Cognito User Pool trước khi cho request đi tiếp |
| **EC2 Spring Boot** | Backend nhận request đã xác thực và xử lý nghiệp vụ |

#### Phạm vi workshop

Workshop tập trung vào **xác thực đầu–cuối** với Cognito và API Gateway:

- Tạo và cấu hình Amazon Cognito User Pool + App Client (SPA).
- Tạo REST API với các resource `/auth`, `/projects`, `/aws`.
- Bảo vệ API bằng Cognito Authorizer; cấu hình CORS; deploy stage `prod`.
- Lấy JWT Token và kiểm chứng: không token → `401`, có token hợp lệ → `200`, dùng Refresh Token để lấy token mới.

![Sơ đồ tổng quan Workshop](/images/5-Workshop/5.1-Workshop-overview/diagram1.png)
