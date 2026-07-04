---
title: "Blog 2"
date: 2024-01-01
weight: 2
chapter: false
pre: " <b> 3.2. </b> "
---

# [AWS Architecture] Xây dựng hệ thống tìm kiếm người dùng mở rộng trên Amazon Cognito

Xin chào các anh chị và các bạn trong cộng đồng AWS Study Group VN!

**Amazon Cognito** là dịch vụ quản lý danh tính và xác thực người dùng rất phổ biến trên AWS. Tuy nhiên, khi số lượng tài khoản tăng lên hàng nghìn hoặc hàng chục nghìn người dùng, nhu cầu tìm kiếm thường vượt xa khả năng mặc định của Cognito.

Để giải quyết bài toán này, AWS Architecture Blog đã giới thiệu một giải pháp xây dựng lớp tìm kiếm chuyên biệt bên cạnh Cognito bằng cách kết hợp **AWS Lambda**, **Amazon DynamoDB** và **Amazon OpenSearch Serverless**. Giải pháp này giúp mở rộng khả năng tìm kiếm, cải thiện hiệu năng và vẫn đảm bảo khả năng mở rộng của hệ thống.

Mình xin chia sẻ một số điểm nổi bật sau khi tìm hiểu kiến trúc này.

---

## 1. Vì sao cần mở rộng khả năng tìm kiếm của Cognito?

Amazon Cognito cung cấp API `ListUsers` để tìm kiếm người dùng theo một số thuộc tính cơ bản. Tuy nhiên, trong thực tế doanh nghiệp thường có những nhu cầu phức tạp hơn như:

- Tìm kiếm theo một phần email hoặc tên người dùng
- Tìm kiếm gần đúng khi nhập sai chính tả
- Lọc theo nhóm quyền (Group)
- Kết hợp nhiều điều kiện truy vấn cùng lúc
- Tìm kiếm trên các thuộc tính tùy chỉnh (Custom Attributes)

Khi số lượng người dùng tăng lớn, việc dựa hoàn toàn vào Cognito có thể ảnh hưởng đến trải nghiệm tìm kiếm và khả năng mở rộng của hệ thống.

---

## 2. Điểm nổi bật của giải pháp

### Tách riêng lớp tìm kiếm chuyên dụng

Thay vì truy vấn trực tiếp vào Cognito mỗi khi cần tìm kiếm, AWS đề xuất xây dựng một **Search Layer** riêng sử dụng **Amazon OpenSearch Serverless**. Mọi dữ liệu người dùng sẽ được đồng bộ từ Cognito sang OpenSearch để phục vụ việc tìm kiếm.

Cách tiếp cận này giúp:

- Giảm tải cho Cognito
- Tăng tốc độ phản hồi
- Hỗ trợ các tính năng tìm kiếm nâng cao
- Dễ dàng mở rộng khi số lượng người dùng tăng trưởng

### Hiệu năng cao với OpenSearch Serverless

Dữ liệu được lập chỉ mục (Indexing) trên OpenSearch Serverless giúp hệ thống:

- Tìm kiếm gần như tức thời
- Hỗ trợ **Fuzzy Search**
- Hỗ trợ **Auto Suggest**
- Kết hợp nhiều bộ lọc phức tạp
- Duy trì hiệu năng ổn định khi dữ liệu tăng trưởng

Đây là lợi thế rất lớn đối với các hệ thống có lượng người dùng lớn như SaaS, CRM hoặc thương mại điện tử.

### Đồng bộ dữ liệu theo thời gian thực

Một điểm đáng chú ý là AWS sử dụng kiến trúc **Event-Driven** để đồng bộ dữ liệu. Mỗi khi người dùng đăng ký, đăng nhập hoặc được cập nhật thông tin, dữ liệu sẽ tự động được ghi nhận và cập nhật sang hệ thống tìm kiếm mà không cần các tác vụ đồng bộ định kỳ. Điều này giúp dữ liệu luôn nhất quán và giảm đáng kể chi phí vận hành.

---

## 3. Quy trình hoạt động

Giải pháp bao gồm hai luồng chính:

![Kiến trúc tìm kiếm người dùng mở rộng trên Amazon Cognito](images/3-BlogsPosted/3.2-Blog2/blog2.png)

### Trường hợp người dùng tương tác với Cognito

Người dùng đăng ký hoặc đăng nhập vào hệ thống thông qua **Amazon Cognito**. Các **Lambda Trigger** của Cognito sẽ được kích hoạt để ghi nhận hoặc cập nhật thông tin người dùng vào **DynamoDB**. Sau đó:

- **DynamoDB Streams** phát hiện thay đổi dữ liệu
- **Lambda** xử lý dữ liệu mới
- **OpenSearch** được cập nhật chỉ mục tương ứng

Nhờ vậy, dữ liệu tìm kiếm luôn được đồng bộ gần như theo thời gian thực.

### Trường hợp quản trị viên cập nhật dữ liệu

Đối với các thao tác như tạo người dùng, khóa tài khoản, cập nhật thuộc tính hoặc thêm người dùng vào Group:

- **AWS CloudTrail** ghi nhận sự kiện
- **Amazon EventBridge** phát hiện thay đổi và kích hoạt Lambda thực hiện cập nhật dữ liệu sang DynamoDB và OpenSearch

Điều này giúp đảm bảo mọi thay đổi trong Cognito đều được phản ánh trên hệ thống tìm kiếm.

---

## 4. Các khả năng tìm kiếm nổi bật

Nhờ OpenSearch Serverless, hệ thống có thể hỗ trợ nhiều hình thức tìm kiếm linh hoạt:

| Loại tìm kiếm | Mô tả | Ví dụ |
| --- | --- | --- |
| **Exact Match** | Tìm kiếm chính xác theo email, username, số điện thoại | `admin@gmail.com` |
| **Prefix Match** | Tìm kiếm theo tiền tố | Nhập `nguy` → trả về `nguyenan@gmail.com`, `nguyenthanh@gmail.com` |
| **Fuzzy Search** | Tìm kiếm gần đúng khi nhập sai chính tả | Nhập `nguyne` vẫn tìm được `nguyen` |
| **Complex Filtering** | Kết hợp nhiều tiêu chí: nhóm quyền, trạng thái, ngày đăng ký, email, số điện thoại | Lọc USER + active + đăng ký tháng 6 |

Đây là tính năng rất hữu ích cho đội ngũ vận hành và chăm sóc khách hàng.

---

## Góc nhìn cá nhân

Theo mình, giá trị lớn nhất của giải pháp này không nằm ở OpenSearch mà nằm ở cách AWS xây dựng luồng đồng bộ dữ liệu theo kiến trúc **Event-Driven**.

Thay vì liên tục truy vấn trực tiếp vào Cognito, hệ thống sử dụng **DynamoDB Streams**, **EventBridge** và **Lambda** để tự động xử lý mọi thay đổi dữ liệu. Điều này giúp kiến trúc vừa linh hoạt vừa dễ mở rộng khi số lượng người dùng tăng trưởng.

Đây cũng là mô hình kiến trúc rất phổ biến trong các hệ thống hiện đại, nơi mỗi dịch vụ chỉ tập trung vào đúng nhiệm vụ của mình: **Cognito** quản lý danh tính, **DynamoDB** lưu trữ dữ liệu, **OpenSearch** phục vụ tìm kiếm và **Lambda** đóng vai trò xử lý sự kiện.

---

## Kết luận

Việc kết hợp **Amazon Cognito**, **AWS Lambda**, **DynamoDB Streams** và **Amazon OpenSearch Serverless** mang lại một giải pháp tìm kiếm người dùng mạnh mẽ, linh hoạt và có khả năng mở rộng cao.

Giải pháp không chỉ khắc phục các giới hạn tìm kiếm mặc định của Cognito mà còn cung cấp khả năng tìm kiếm nâng cao với hiệu năng cao, dữ liệu được đồng bộ gần thời gian thực và hỗ trợ nhiều hình thức lọc phức tạp.

Đây là một kiến trúc đáng tham khảo cho các hệ thống SaaS, CRM, thương mại điện tử hoặc bất kỳ ứng dụng nào cần quản lý số lượng lớn người dùng trên nền tảng AWS.

**Tài liệu tham khảo:**

[Building a scalable user search layer on top of Amazon Cognito](https://aws.amazon.com/vi/blogs/architecture/building-a-scalable-user-search-layer-on-top-of-amazon-cognito/)

Rất mong nhận được thêm ý kiến trao đổi từ các anh chị và các bạn trong cộng đồng!
