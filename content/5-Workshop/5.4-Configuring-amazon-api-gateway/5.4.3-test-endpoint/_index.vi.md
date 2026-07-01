---
title : "Cấu hình JWT Authorizer"
date : 2024-01-01 
weight : 3
chapter : false
pre : " <b> 5.4.3 </b> "
---

#### Cấu hình Cognito Authorizer tích hợp User Pool

Cognito Authorizer giúp API Gateway tự động xác thực mỗi request bằng cách kiểm tra JWT Token trong header `Authorization` với Cognito User Pool — không cần viết code xác thực trong backend.

**Bước 1 – Tạo Authorizer**

1. Trong API `zerobug-agent-api` → menu trái **Authorizers**.
2. Nhấn **Create authorizer**.

![Mở Authorizers](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.3/1.png)

**Bước 2 – Cấu hình Cognito Authorizer**

1. **Authorizer name**: `zerobug-cognito-authorizer`.
2. **Authorizer type**: chọn **Cognito**.
3. **Cognito user pool**:
   - **Region**: `ap-southeast-1`.
   - Chọn pool `zerobug-agent-user-pool` (ID `ap-southeast-1_GevSgtD8j`).
4. **Token source**: nhập `Authorization` (tên header chứa token).
5. **Token validation**: để trống.
6. Nhấn **Create authorizer**.

![Tạo Cognito Authorizer](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.3/2.png)

{{% notice note %}}
**Token source = `Authorization`** nghĩa là client phải gắn header `Authorization: <IdToken>`. Với REST API + Cognito Authorizer, giá trị là **chuỗi token thuần** (không có tiền tố `Bearer `).
{{% /notice %}}

**Bước 3 – Gán Authorizer vào Method**

1. Menu trái **Resources** → chọn method **GET** của `/projects`.
2. Mở tab **Method request** → nhấn **Edit**.
3. **Authorization**: chọn `zerobug-cognito-authorizer`.
4. Nhấn **Save**.
5. Lặp lại cho method **GET** của `/auth` và `/aws`.

![Gán Authorizer vào Method](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.3/4.png)
![Gán Authorizer vào Method](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.3/5.png)

**Bước 4 – Test nhanh Authorizer (tùy chọn)**

1. Quay lại **Authorizers** → chọn `zerobug-cognito-authorizer` → **Test**.
2. Dán một IdToken hợp lệ vào ô **Authorization** (lấy ở bước 5.5).
3. Token hợp lệ → trả về **200** kèm claims; thiếu/sai token → **401**.

{{% notice tip %}}
Mỗi lần thay đổi Authorizer hoặc Method, hãy nhớ **Deploy API lại** (bước 5.4.5) thì thay đổi mới có hiệu lực trên stage `prod`.
{{% /notice %}}

![Test Authorizer](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.3/3.png)
