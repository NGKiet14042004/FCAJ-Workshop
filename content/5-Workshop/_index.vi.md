---
title: "Workshop"
date: 2024-01-01
weight: 5
chapter: false
pre: " <b> 5. </b> "
---

# ZeroBug Agent – Xác thực và Ủy quyền với Amazon Cognito và API Gateway

#### Tổng quan

**ZeroBug Agent** sử dụng **Amazon Cognito** làm Identity Provider và **Amazon API Gateway** làm cổng bảo vệ toàn bộ luồng REST API. Workshop này hướng dẫn từng bước thiết lập hệ thống xác thực đầu-cuối, từ việc tạo User Pool, cấu hình App Client, cho đến bảo vệ API bằng JWT Authorizer.

Sau khi hoàn thành workshop, bạn sẽ có một luồng xác thực hoàn chỉnh:

```
Người dùng đăng nhập → Amazon Cognito cấp JWT Token (IdToken)
    → Front-end (Vite SPA / Electron) gắn token vào header Authorization
    → Amazon API Gateway xác thực token qua Cognito Authorizer
    → ALB → EC2 Spring Boot (Backend)
```

#### Nội dung

1. [Giới thiệu](5.1-Workshop-overview/)
2. [Các bước chuẩn bị](5.2-Prerequiste/)
3. [Thiết lập Amazon Cognito](5.3-Setting-up-amazon-cognito/)
4. [Cấu hình Amazon API Gateway](5.4-Configuring-amazon-api-gateway/)
5. [Kiểm tra luồng xác thực](5.5-Testing-the-authentication-flow/)
6. [Dọn dẹp tài nguyên](5.6-Cleanup/)
