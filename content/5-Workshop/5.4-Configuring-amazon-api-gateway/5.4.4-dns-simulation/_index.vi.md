---
title : "Cấu hình CORS cho Vite SPA"
date : 2024-01-01 
weight : 4
chapter : false
pre : " <b> 5.4.4 </b> "
---

#### Cấu hình CORS (Cross-Origin Resource Sharing) cho Vite SPA

Vite SPA chạy tại `http://localhost:5173` — khác domain với API Gateway, nên trình duyệt sẽ chặn request nếu CORS chưa được cấu hình. CORS cho phép front-end gọi API từ trình duyệt.

**Bước 1 – Bật CORS cho /projects**

1. Trong Resources view của `zerobug-agent-api`, chọn resource **`/projects`**.
2. Nhấn **Enable CORS**.
3. Điền cấu hình:

| Setting | Giá trị |
| --- | --- |
| **Access-Control-Allow-Origin** | `http://localhost:5173` (hoặc `*` khi chỉ demo nhanh) |
| **Access-Control-Allow-Headers** | `Content-Type, Authorization` |
| **Access-Control-Allow-Methods** | `GET, OPTIONS` (thêm `POST, DELETE` nếu cần sau này) |

4. Nhấn **Save**.

![Enable CORS](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.4/1.png)
![Enable CORS](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.4/2.png)

{{% notice warning %}}
Header **`Authorization`** bắt buộc phải nằm trong **Access-Control-Allow-Headers**, nếu không front-end sẽ không gửi được token qua trình duyệt và bị lỗi CORS.
{{% /notice %}}

**Bước 2 – Lặp lại cho /auth và /aws**

1. Chọn `/auth` → **Enable CORS** → cấu hình như trên → **Save**.
2. Chọn `/aws` → **Enable CORS** → cấu hình như trên → **Save**.

![CORS cho mọi resource](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.4/2.png)

**Bước 3 – Kiểm tra method OPTIONS tự tạo**

Khi bật CORS, API Gateway tự tạo method **OPTIONS** cho mỗi resource (preflight request của trình duyệt). Xác nhận `OPTIONS` xuất hiện cạnh `GET` trong cây resource — đây là bình thường.

{{% notice note %}}
Sau khi bật CORS cho tất cả resource, tiến hành **Deploy API** ở bước 5.4.5 để các thay đổi có hiệu lực.
{{% /notice %}}

![Method OPTIONS](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.4/3.png)
