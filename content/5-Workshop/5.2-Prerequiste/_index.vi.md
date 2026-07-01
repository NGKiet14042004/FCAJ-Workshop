---
title : "Các bước chuẩn bị"
date : 2024-01-01 
weight : 2 
chapter : false
pre : " <b> 5.2. </b> "
---

#### Mục tiêu

Trước khi bắt đầu, bạn cần: một tài khoản AWS, một **IAM User** có đủ quyền cho Cognito và API Gateway, công cụ test API (Postman), và chọn đúng **Region**.

#### 1. Đăng nhập Console và chọn Region

1. Đăng nhập [AWS Management Console](https://console.aws.amazon.com/) bằng tài khoản **Root**.
2. Ở góc trên bên phải, mở dropdown Region và chọn **Asia Pacific (Singapore) `ap-southeast-1`**.

{{% notice note %}}
Toàn bộ workshop thực hiện trên region **ap-southeast-1**. Hãy đảm bảo Region luôn đúng ở mọi bước (Cognito, API Gateway, CLI).
{{% /notice %}}

![Chọn Region ap-southeast-1](/images/5-Workshop/5.2-Prerequisite/1.png)

#### 2. Tạo IAM User cho workshop

Thay vì thao tác bằng tài khoản Root, ta tạo một IAM User riêng để làm việc (đúng nguyên tắc an toàn).

**Bước 1 – Mở IAM và tạo user**

1. Thanh tìm kiếm → gõ **IAM** → mở dịch vụ **IAM**.
2. Menu trái → **Users** → nhấn **Create user**.
3. **User name**: `zerobug-admin`.
4. Tích **Provide user access to the AWS Management Console** (nếu muốn user đăng nhập Console) → chọn **I want to create an IAM user** → đặt **Custom password**.
5. Nhấn **Next**.

![Tạo IAM User](/images/5-Workshop/5.2-Prerequisite/2.png)
![Tạo User](/images/5-Workshop/5.2-Prerequisite/3.png)
![Đặt Tên User](/images/5-Workshop/5.2-Prerequisite/4.png)

**Bước 2 – Gán quyền bằng AWS Managed Policies**

1. Chọn **Attach policies directly**.
2. Tìm và tích các policy có sẵn sau:
   - `AmazonCognitoPowerUser`
   - `AmazonAPIGatewayAdministrator`
   - `IAMReadOnlyAccess`
3. Nhấn **Next** → xem lại → **Create user**.

{{% notice tip %}}
Đây là các **AWS Managed Policy** — Amazon đã viết sẵn nội dung quyền (JSON) bên trong, bạn chỉ cần tích chọn, **không cần** dán đoạn JSON nào. Bạn chỉ phải viết JSON khi tạo **custom policy** (Create policy → tab JSON).
{{% /notice %}}

![Gán managed policies](/images/5-Workshop/5.2-Prerequisite/5.png)
![Tạo Xong User](/images/5-Workshop/5.2-Prerequisite/6.png)

#### 3. Tạo Access Key cho AWS CLI

Một số thao tác (ví dụ đặt mật khẩu vĩnh viễn cho user test ở bước 5.3.3, lấy JWT Token ở bước 5.5) cần AWS CLI. Để CLI hoạt động, tạo Access Key:

1. **IAM** → **Users** → `zerobug-admin` → tab **Security credentials**.
2. Mục **Access keys** → **Create access key** → chọn **Command Line Interface (CLI)** → tích xác nhận → **Create access key**.
3. Lưu lại **Access key ID** và **Secret access key** (Secret chỉ hiển thị **một lần**).

{{% notice warning %}}
**Không** chia sẻ hay đăng công khai **Secret access key**. Sau khi hoàn thành workshop, hãy **Deactivate** và **Delete** access key này (xem bước 5.6).
{{% /notice %}}

![Tạo Access Key](/images/5-Workshop/5.2-Prerequisite/7.png)
![Tạo Access Key](/images/5-Workshop/5.2-Prerequisite/8.png)
![Tạo Access Key](/images/5-Workshop/5.2-Prerequisite/9.png)

Cấu hình CLI:

```powershell
aws configure
# AWS Access Key ID     : <access key của bạn>
# AWS Secret Access Key : <secret key của bạn>
# Default region name   : ap-southeast-1
# Default output format : json
```

Kiểm tra cấu hình:

```powershell
aws sts get-caller-identity
```

![Cấu hình AWS CLI](/images/5-Workshop/5.2-Prerequisite/10.png)

#### 4. Cài đặt công cụ test API

Cài **Postman** để gọi và quan sát response trực quan:

1. Tải tại [https://www.postman.com/downloads/](https://www.postman.com/downloads/).
2. Cài đặt và mở Postman.

Hoặc dùng **curl** có sẵn trên Windows 10/11 (gọi `curl.exe` trong PowerShell). Kiểm tra:

```powershell
curl.exe --version
```