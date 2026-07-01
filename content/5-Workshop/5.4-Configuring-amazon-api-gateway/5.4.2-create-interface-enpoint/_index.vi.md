---
title : "Định nghĩa Resources và Methods"
date : 2024-01-01 
weight : 2
chapter : false
pre : " <b> 5.4.2 </b> "
---

#### Định nghĩa Resources và Methods (/auth, /projects, /aws)

ZeroBug Agent có 3 nhóm resource chính, mỗi nhóm tương ứng một module nghiệp vụ trong Spring Boot backend:

```
/ (root)
├── /auth        → Đăng nhập / đăng ký / refresh token
├── /projects    → Quản lý dự án
└── /aws         → Trạng thái hệ thống AWS
```

{{% notice note %}}
Trong workshop này, mỗi resource được tạo với 1 method **GET** dùng **Mock integration** để **kiểm tra việc xác thực** (API Gateway có chặn request thiếu token hay không). Khi ghép backend thật, bạn sẽ đổi integration sang **HTTP / VPC Link** trỏ tới ALB → EC2.
{{% /notice %}}

**Bước 1 – Tạo resource /auth**

1. Trong Resources view, chọn root `/`.
2. Nhấn **Create resource**.
3. **Resource name**: `auth` (Resource path giữ `/`).
4. Nhấn **Create resource**.

![Tạo resource /auth](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.2/1.png)
![Tạo resource /auth](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.2/2.png)

**Bước 2 – Tạo resource /projects và /aws**

1. Chọn lại root `/` → **Create resource** → nhập `projects` → **Create resource**.
2. Chọn lại root `/` → **Create resource** → nhập `aws` → **Create resource**.

![Cây resource đầy đủ](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.2/3.png)

**Bước 3 – Tạo method GET cho /projects**

1. Click chọn resource **`/projects`**.
2. Nhấn **Create method**.
3. **Method type**: chọn **GET**.
4. **Integration type**: chọn **Mock**.
5. Nhấn **Create method**.

![Tạo method GET](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.2/4.png)
![Tạo method GET](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.2/5.png)

**Bước 4 – Tạo method GET cho /auth và /aws**

1. Chọn `/auth` → **Create method** → **GET** → **Mock** → **Create method**.
2. Chọn `/aws` → **Create method** → **GET** → **Mock** → **Create method**.

Sau bước này, mỗi resource `/auth`, `/projects`, `/aws` đều có một method **GET**.

![Method GET cho mọi resource](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.2/6.png)

{{% notice tip %}}
**Mock integration** trả về phản hồi giả lập, đủ để kiểm chứng tầng xác thực mà chưa cần backend. Mục tiêu của workshop là chứng minh **Cognito Authorizer** chặn/cho phép request đúng cách.
{{% /notice %}}
