---
title: "Blog 3"
date: 2024-01-01
weight: 3
chapter: false
pre: " <b> 3.3. </b> "
---

# Tìm hiểu kiến trúc Protein Research Copilot với Amazon Bedrock AgentCore trên AWS

## Giới thiệu

Trong quá trình tìm hiểu về các ứng dụng AI trên AWS, mình khá ấn tượng với bài viết giới thiệu **Protein Research Copilot** sử dụng **Amazon Bedrock AgentCore**. Đây là một giải pháp hỗ trợ các nhà nghiên cứu sinh học tìm kiếm và phân tích peptide thông qua ngôn ngữ tự nhiên, giúp giảm đáng kể thời gian xử lý dữ liệu.

Thay vì phải sử dụng nhiều công cụ riêng lẻ để tìm kiếm, so sánh và tổng hợp kết quả, người dùng chỉ cần đặt câu hỏi và hệ thống sẽ tự động thực hiện toàn bộ quy trình phía sau.

---

## Bài toán đặt ra

Trong lĩnh vực nghiên cứu protein, các nhà khoa học thường phải làm việc với lượng dữ liệu rất lớn. Việc tìm kiếm những peptide có đặc điểm tương đồng không chỉ mất thời gian mà còn đòi hỏi nhiều bước xử lý khác nhau.

Khi dữ liệu ngày càng tăng, các phương pháp truyền thống dễ gặp phải những hạn chế như:

- Thời gian tìm kiếm lâu
- Khó tổng hợp kết quả
- Khó mở rộng hệ thống

---

## Cách tiếp cận của AWS

Để giải quyết vấn đề này, AWS xây dựng **Protein Research Copilot** dựa trên mô hình **AI Agent**.

Khi người dùng nhập một câu hỏi bằng ngôn ngữ tự nhiên, hệ thống sẽ tự động:

1. Phân tích yêu cầu
2. Chuyển đổi chuỗi protein thành dữ liệu vector
3. Thực hiện tìm kiếm các peptide tương tự
4. Tạo ra bản tóm tắt kết quả bằng AI

Nhờ đó, toàn bộ quá trình nghiên cứu được đơn giản hóa thành một cuộc hội thoại với trợ lý AI.

---

## Các dịch vụ AWS được sử dụng

Kiến trúc của hệ thống kết hợp nhiều dịch vụ AWS khác nhau:

![Kiến trúc Protein Research Copilot với Amazon Bedrock AgentCore](images/3-BlogsPosted/3.3-Blog3/blog3.png)

| Dịch vụ | Vai trò |
| --- | --- |
| **Amazon Bedrock AgentCore** | Điều phối toàn bộ quy trình xử lý thông qua các AI Agent chuyên biệt |
| **Amazon Bedrock** | Cung cấp mô hình AI giúp hiểu yêu cầu và tạo nội dung phản hồi |
| **Amazon SageMaker AI** | Triển khai mô hình tạo embedding cho protein |
| **Amazon Aurora PostgreSQL** | Lưu trữ dữ liệu peptide và hỗ trợ tìm kiếm theo độ tương đồng |
| **Amazon RDS Data API** | Truy cập cơ sở dữ liệu một cách an toàn |
| **AWS Fargate** | Triển khai giao diện người dùng (Streamlit UI) mà không cần quản lý máy chủ |

Trong kiến trúc multi-agent, **Orchestrator Agent** điều phối ba agent chuyên biệt:

- **Parser Agent** — phân tích chuỗi protein, tích hợp với Amazon SageMaker Serverless
- **Searcher Agent** — truy vấn cơ sở dữ liệu peptide trên Amazon Aurora
- **Summarizer Agent** — tổng hợp kết quả bằng Amazon Bedrock LLMs

Sự kết hợp này giúp hệ thống vừa có khả năng mở rộng cao vừa tối ưu chi phí vận hành.

---

## Điều mình học được

Qua bài viết, mình hiểu rõ hơn cách AWS kết hợp các dịch vụ AI, Machine Learning và cơ sở dữ liệu để xây dựng một hệ thống nghiên cứu thông minh.

Điểm thú vị nhất là việc sử dụng **AI Agent** để tự động hóa toàn bộ quy trình phân tích dữ liệu. Thay vì chỉ đóng vai trò chatbot, AI có thể phối hợp nhiều công cụ khác nhau để thực hiện một tác vụ hoàn chỉnh.

Đồng thời, bài viết cũng giúp mình hiểu thêm về vai trò của **Amazon Bedrock AgentCore** trong việc xây dựng các ứng dụng AI thế hệ mới trên AWS — nơi nhiều agent chuyên biệt phối hợp dưới sự điều phối của một Orchestrator để giải quyết bài toán phức tạp.

---

## Kết luận

**Protein Research Copilot** là một ví dụ thực tế cho thấy tiềm năng của AI Agent trong lĩnh vực nghiên cứu khoa học. Bằng cách kết hợp **Amazon Bedrock AgentCore**, **SageMaker AI** và **Aurora PostgreSQL**, AWS đã tạo ra một hệ thống có khả năng tự động tìm kiếm, phân tích và tóm tắt dữ liệu nghiên cứu một cách hiệu quả.

Đây là kiến trúc đáng tham khảo cho các tổ chức nghiên cứu, doanh nghiệp công nghệ sinh học hoặc bất kỳ đơn vị nào muốn ứng dụng AI vào việc khai thác và phân tích dữ liệu chuyên sâu.

**Nguồn tham khảo:**

[Build a Protein Research Copilot with Amazon Bedrock AgentCore](https://aws.amazon.com/blogs/machine-learning/build-a-protein-research-copilot-with-amazon-bedrock-agentcore/)

Mình rất mong nhận được thêm ý kiến trao đổi từ mọi người trong cộng đồng!
