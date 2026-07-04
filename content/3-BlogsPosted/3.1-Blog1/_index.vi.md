---
title: "Blog 1"
date: 2024-01-01
weight: 1
chapter: false
pre: " <b> 3.1. </b> "
---

# Amazon Bedrock AgentCore Web Search – Giúp AI Agent truy cập kiến thức mới nhất từ Internet mà không cần tự xây dựng hệ thống Search

Trong quá trình phát triển AI Agent, một trong những hạn chế lớn nhất là kiến thức của mô hình chỉ dừng lại ở thời điểm được huấn luyện. Khi người dùng hỏi về tin tức vừa công bố, xu hướng thị trường mới nhất hay một sự kiện vừa diễn ra, Agent thường không thể đưa ra câu trả lời chính xác nếu không được bổ sung nguồn dữ liệu thời gian thực.

Để giải quyết vấn đề này, AWS vừa chính thức giới thiệu **Web Search trên Amazon Bedrock AgentCore**, cho phép AI Agent tìm kiếm và sử dụng thông tin từ Internet thông qua một dịch vụ được quản lý hoàn toàn bởi AWS.

Mình xin chia sẻ một số điểm nổi bật sau khi tìm hiểu bài viết từ AWS Blog và rất mong nhận được thêm ý kiến đóng góp từ mọi người trong nhóm.

---

## 1. Điểm mới của dịch vụ

Trước đây, để Agent có khả năng tìm kiếm trên Internet, các đội phát triển thường phải:

- Tích hợp Search API từ bên thứ ba.
- Quản lý API Key, quota và rate limit.
- Xử lý dữ liệu trả về từ nhiều nguồn khác nhau.
- Xây dựng cơ chế trích xuất nội dung phù hợp cho mô hình AI.
- Giải quyết các yêu cầu liên quan đến bảo mật và quyền riêng tư dữ liệu.

Với Web Search trên Amazon Bedrock AgentCore, AWS đã đóng gói toàn bộ quy trình này thành một dịch vụ **Fully Managed**.

Chỉ cần kết nối Web Search Tool vào AgentCore Gateway, AI Agent có thể tự động khám phá và sử dụng khả năng tìm kiếm web thông qua chuẩn **MCP (Model Context Protocol)**, giúp giảm đáng kể công sức triển khai và vận hành.

---

## 2. Những lợi ích nổi bật

### Cập nhật kiến thức gần thời gian thực

AWS xây dựng và vận hành một **Web Index** riêng với quy mô hàng chục tỷ tài liệu trên Internet.

Nguồn dữ liệu này được cập nhật liên tục chỉ trong vài phút sau khi nội dung mới xuất hiện, giúp Agent có thể trả lời các câu hỏi liên quan đến:

- Tin tức mới nhất.
- Xu hướng công nghệ.
- Sự kiện đang diễn ra.
- Các thông báo hoặc sản phẩm vừa được công bố.

Điều này giúp hạn chế tình trạng AI trả lời dựa trên dữ liệu đã lỗi thời.

### Nâng cao độ chính xác của câu trả lời

Web Search không chỉ trả về danh sách trang web như công cụ tìm kiếm truyền thống.

AWS còn kết hợp:

- **Knowledge Graph** để xác thực các thông tin thực tế.
- **Semantic Snippet Extraction** để trích xuất đúng phần nội dung liên quan đến câu hỏi.

Nhờ đó Agent có thể đưa ra câu trả lời có căn cứ hơn, giảm hiện tượng "hallucination" và tăng chất lượng phản hồi.

### Đảm bảo quyền riêng tư dữ liệu

Một trong những điểm đáng chú ý là toàn bộ truy vấn được xử lý bên trong hạ tầng AWS.

Điều này giúp:

- Không phải gửi truy vấn sang công cụ tìm kiếm bên ngoài.
- Không cần quản lý API Key của nhà cung cấp thứ ba.
- Giảm rủi ro liên quan đến bảo mật dữ liệu và tuân thủ quy định doanh nghiệp.

Đối với các tổ chức có yêu cầu cao về bảo mật, đây là một lợi thế rất đáng cân nhắc.

### Giảm độ phức tạp trong vận hành

Thay vì phải xây dựng và duy trì riêng một hệ thống tìm kiếm, doanh nghiệp có thể sử dụng trực tiếp dịch vụ được AWS quản lý.

Các tác vụ như quản lý hạ tầng Search, cập nhật dữ liệu, tối ưu chất lượng kết quả và quản lý xác thực dịch vụ đều được AWS xử lý phía sau.

---

## 3. Luồng hoạt động của hệ thống

Quan sát kiến trúc dịch vụ có thể thấy luồng xử lý khá đơn giản:

![Amazon Bedrock AgentCore Web Search Tool Architecture](images/3-BlogsPosted/3.1-Blog1/blog1.png)

| Bước | Mô tả |
| --- | --- |
| **Bước 1** | Người dùng gửi câu hỏi tới AI Agent. |
| **Bước 2** | Agent xác định câu hỏi cần thông tin mới từ Internet. |
| **Bước 3** | AgentCore Gateway chuyển yêu cầu tới Web Search Tool của AWS. |
| **Bước 4** | Web Search truy xuất dữ liệu từ Web Index và Knowledge Graph. |
| **Bước 5** | Nội dung liên quan được trích xuất và gửi về cho mô hình AI. |
| **Bước 6** | LLM tổng hợp thông tin, tạo câu trả lời và đính kèm nguồn tham khảo nếu cần. |

Toàn bộ quá trình diễn ra tự động mà không cần đội phát triển xây dựng riêng hệ thống Search.

---

## 4. Trường hợp sử dụng thực tế

Tính năng này đặc biệt phù hợp với:

- **AI Research Assistant** cần tổng hợp thông tin mới từ Internet.
- **Chatbot doanh nghiệp** cần cập nhật tin tức thị trường.
- **Customer Support Agent** cần tra cứu chính sách hoặc thông tin sản phẩm mới nhất.
- Các ứng dụng **Generative AI** cần kết hợp dữ liệu nội bộ với dữ liệu thời gian thực từ bên ngoài.

Trong thực tế, nhiều hệ thống có thể kết hợp cả **Amazon Bedrock Knowledge Bases** và **Web Search**.

Knowledge Base dùng để trả lời các câu hỏi liên quan đến dữ liệu nội bộ doanh nghiệp, trong khi Web Search hỗ trợ những nội dung thay đổi liên tục ngoài môi trường thực tế.

---

## Góc nhìn cá nhân

Theo mình, điểm giá trị nhất của Web Search trên Amazon Bedrock AgentCore không phải là khả năng tìm kiếm Internet, mà là việc AWS đã biến toàn bộ quá trình này thành một dịch vụ được quản lý hoàn toàn.

Thay vì dành thời gian tích hợp Search API, xử lý dữ liệu và giải quyết các bài toán bảo mật, đội phát triển có thể tập trung nhiều hơn vào logic nghiệp vụ của Agent.

Mô hình kết hợp giữa dữ liệu nội bộ (Knowledge Base) và dữ liệu thời gian thực từ Web Search được dự đoán sẽ trở thành kiến trúc phổ biến cho các AI Agent trong tương lai, đặc biệt đối với các hệ thống hỗ trợ nghiên cứu, chăm sóc khách hàng và ra quyết định.

---

## Kết luận

Web Search trên Amazon Bedrock AgentCore giúp AI Agent tiếp cận kiến thức mới nhất từ Internet thông qua một dịch vụ được AWS quản lý hoàn toàn, đồng thời đảm bảo tính bảo mật, khả năng mở rộng và độ chính xác của dữ liệu.

Đây là một tính năng đáng chú ý đối với các tổ chức đang xây dựng AI Agent trên AWS và muốn nâng cao chất lượng phản hồi bằng nguồn dữ liệu thời gian thực mà không phải tự vận hành hạ tầng tìm kiếm riêng.

**Tài liệu tham khảo:**

[Introducing Web Search on Amazon Bedrock AgentCore](https://aws.amazon.com/blogs/machine-learning/introducing-web-search-on-amazon-bedrock-agentcore/)

Mình cảm ơn mọi người đã theo dõi bài viết của mình. Mình rất mong nhận được thêm ý kiến trao đổi từ mọi người trong cộng đồng.
