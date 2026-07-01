---
title : "Cấu hình Amazon API Gateway"
date : 2024-01-01
weight : 4
chapter : false
pre : " <b> 5.4. </b> "
---

#### Tổng quan

**Amazon API Gateway** đóng vai trò cổng vào (entry point) công khai duy nhất cho toàn bộ REST API của ZeroBug Agent. Mọi request từ Vite SPA hoặc Electron đều đi qua API Gateway trước khi được chuyển tiếp vào ALB → EC2 Spring Boot trong Private Subnet.

API Gateway trong dự án thực hiện các nhiệm vụ:

- Định nghĩa và quản lý các Routes (`/auth`, `/projects`, `/aws`, ...).
- Xác thực JWT Token thông qua **JWT Authorizer** tích hợp Cognito.
- Xử lý **CORS** cho Vite SPA chạy trên domain khác.
- Cung cấp môi trường staging/production qua **Deployment Stage**.

#### Nội dung

- [Tạo REST API](5.4.1-prepare/)
- [Định nghĩa Resources và Methods](5.4.2-create-interface-enpoint/)
- [Cấu hình JWT Authorizer](5.4.3-test-endpoint/)
- [Cấu hình CORS cho Vite SPA](5.4.4-dns-simulation/)
- [Deploy lên Stage](5.4.5-deploy-stage/)
