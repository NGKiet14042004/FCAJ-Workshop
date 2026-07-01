---
title : "Tạo tài khoản người dùng test"
date : 2024-01-01 
weight : 3
chapter : false
pre : " <b> 5.3.3 </b> "
---

#### Tạo tài khoản người dùng test (admin@gmail.com)

Sau khi có User Pool và App Client, ta tạo một tài khoản test để kiểm tra luồng xác thực ở bước 5.5.

**Bước 1 – Tạo user trên Console**

1. Trong User Pool `zerobug-agent-user-pool` → menu trái **Users** → nhấn **Create user**.
2. Điền thông tin:
   - **Invitation message**: chọn **Don't send an invitation**.
   - **Email address**: `admin@gmail.com` — tích **Mark email address as verified**.
   - **Password**: chọn **Set a password** → nhập `Admin@12345`.
3. Nhấn **Create user**.

![Tạo user](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.3/1.png)
![Tạo user](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.3/2.png)

**Bước 2 – Xử lý trạng thái "Force change password"**

Sau khi tạo, user thường hiển thị **Confirmation status: Force change password**. Đây là hành vi mặc định của Cognito: mọi mật khẩu do **admin** đặt đều bị coi là *tạm thời*, lần đăng nhập đầu sẽ bị bắt đổi mật khẩu — gây phiền khi lấy token ở bước 5.5 (gặp challenge `NEW_PASSWORD_REQUIRED`).

![Force change password](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.3/3.png)

Để chuyển sang **Confirmed**, đặt mật khẩu thành **vĩnh viễn (permanent)** bằng AWS CLI. Mở PowerShell và chạy:

```powershell
aws cognito-idp admin-set-user-password --user-pool-id ap-southeast-1_GevSgtD8j --username admin@gmail.com --password "Admin@12345" --permanent --region ap-southeast-1
```

{{% notice note %}}
Console hiện **không có** nút biến mật khẩu thành vĩnh viễn, nên lệnh CLI `admin-set-user-password --permanent` là cách chắc chắn nhất. Nếu CLI báo *"Unable to locate credentials"*, hãy cấu hình `aws configure` như ở bước 5.2.
{{% /notice %}}

![AWS CLI](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.3/4.png)

**Bước 3 – Kiểm tra kết quả**

Quay lại tab **Users** → **refresh**. Trạng thái `admin@gmail.com` chuyển thành **Confirmed**.

![User Confirmed](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.3/5.png)

{{% notice tip %}}
Lưu lại thông tin đăng nhập để dùng ở bước 5.5:

| Thông tin | Giá trị |
| --- | --- |
| Email | `admin@gmail.com` |
| Password | `Admin@12345` |
{{% /notice %}}
