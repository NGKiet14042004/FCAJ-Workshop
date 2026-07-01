---
title : "Deploy lên Stage"
date : 2024-01-01 
weight : 5
chapter : false
pre : " <b> 5.4.5 </b> "
---

#### Deploy API lên Stage (prod)

Sau khi cấu hình đầy đủ Resources, Methods, Cognito Authorizer và CORS, bước cuối là **Deploy** API để tạo ra URL công khai có thể gọi được.

**Bước 1 – Deploy API**

1. Trong API `zerobug-agent-api`, nhấn **Deploy API** (góc trên bên phải).
2. **Stage**: chọn **New stage**.
3. **Stage name**: nhập `prod`.
4. **Description**: `Production stage` (tùy chọn).
5. Nhấn **Deploy**.

![Deploy API](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.5/1.png)
![Deploy API](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.5/2.png)

**Bước 2 – Lấy Invoke URL**

Sau khi deploy, vào menu trái **Stages** → chọn `prod`. Ở trên cùng là **Invoke URL** có dạng:

```
https://<API_ID>.execute-api.ap-southeast-1.amazonaws.com/prod
```

Ví dụ của workshop này:

```
https://sb9qx62pe9.execute-api.ap-southeast-1.amazonaws.com/prod
```

![Invoke URL](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.5/3.png)

**Bước 3 – Ghi lại endpoint của từng resource**

Endpoint để test = Invoke URL + đường dẫn resource:

| Endpoint | URL đầy đủ |
| --- | --- |
| Projects | `<Invoke URL>/projects` |
| Auth | `<Invoke URL>/auth` |
| AWS status | `<Invoke URL>/aws` |

Cấu hình base URL cho Vite SPA:

```env
VITE_API_GATEWAY_URL=https://sb9qx62pe9.execute-api.ap-southeast-1.amazonaws.com/prod
```

{{% notice note %}}
**Lỗi hay gặp:** mỗi lần thay đổi Resource / Method / Authorizer / CORS, bạn phải **Deploy API lại** thì thay đổi mới có hiệu lực trên stage `prod`. Nếu test thấy "không cập nhật", hãy deploy lại.
{{% /notice %}}
