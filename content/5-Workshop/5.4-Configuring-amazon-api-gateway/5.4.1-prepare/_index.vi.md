---
title : "Tạo REST API"
date : 2024-01-01 
weight : 1
chapter : false
pre : " <b> 5.4.1 </b> "
---

#### Tạo REST API trên Amazon API Gateway

**Bước 1 – Mở API Gateway Console**

1. Đăng nhập [AWS Management Console](https://console.aws.amazon.com/), đảm bảo Region là **ap-southeast-1**.
2. Tìm kiếm **API Gateway** → mở dịch vụ.

![Mở API Gateway](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.1/1.png)

**Bước 2 – Chọn loại API**

1. Tìm khung **REST API** (không phải **REST API Private**, cũng không phải **HTTP API** hay **WebSocket API**).
2. Nhấn **Build** trong khung REST API.

{{% notice note %}}
ZeroBug Agent dùng **REST API** vì cần tích hợp **Cognito Authorizer**, **Usage Plans / API Keys** và nhiều tùy chọn nâng cao hơn so với HTTP API.
{{% /notice %}}

![Chọn REST API](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.1/2.png)

**Bước 3 – Cấu hình API**

1. Chọn **New API**.
2. **API name**: `zerobug-agent-api`.
3. **Description**: `API Gateway cho ZeroBug Agent` (tùy chọn).
4. **API endpoint type**: chọn **Regional** (vì đặt trong region ap-southeast-1; production đã có CloudFront xử lý CDN).
5. Nhấn **Create API**.

![Tạo REST API](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.1/3.png)

**Bước 4 – Xem cấu trúc API vừa tạo**

Sau khi tạo, bạn thấy giao diện **Resources** với root `/`. Đây là điểm xuất phát để thêm các resource `/auth`, `/projects`, `/aws` ở bước 5.4.2.

![REST API đã tạo](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.1/4.png)
