---
title: "Tự đánh giá"
date: 2024-01-01
weight: 6
chapter: false
pre: " <b> 6. </b> "
---

Trong suốt 12 tuần tham gia chương trình **First Cloud AI Journey**, tôi đã trải qua hành trình học tập AWS từ nền tảng đến triển khai thực tế, và tham gia xây dựng đồ án nhóm **ZeroBug Agent** với vai trò phụ trách **khối TV2 — Lớp dữ liệu & bí mật**.

Phạm vi công việc của tôi trong đồ án gồm: triển khai **Amazon S3** (bucket private lưu source và JAR), **Amazon RDS PostgreSQL** (metadata, lịch sử, vector RAG), **AWS Secrets Manager** (credential DB), khởi tạo **pgvector** và bảng `code_embeddings`, cùng việc bật **Bedrock Mantle model access** (chat + embedding) ở region `us-east-1`. Sau khi hoàn thành, tôi điền bảng tham số chung và bàn giao cho Toàn (EC2/ALB) và Hoa (Lambda/Step Functions). Qua đó, tôi củng cố kỹ năng **thiết kế lớp lưu trữ đám mây, bảo mật credential, tích hợp RAG trên RDS** và phối hợp triển khai theo thứ tự phụ thuộc trong nhóm.

Về tác phong, tôi cố gắng hoàn thành đúng hạn các mục tiêu từng tuần, chủ động tự nghiên cứu khi gặp vấn đề kỹ thuật (RDS private access, pgvector, cross-region Bedrock) và tham khảo tài liệu AWS chính thức cùng nội dung Workshop.

Để phản ánh khách quan quá trình tham gia chương trình, tôi xin tự đánh giá bản thân dựa trên các tiêu chí dưới đây:

| STT | Tiêu chí                            | Mô tả                                                                                            | Tốt | Khá | Trung bình |
| --- | ----------------------------------- | ------------------------------------------------------------------------------------------------ | --- | --- | ---------- |
| 1   | **Kiến thức và kỹ năng chuyên môn** | Hiểu cách triển khai S3, RDS, Secrets Manager, pgvector và Bedrock Mantle model access; áp dụng vào ZeroBug Agent | ☐   | ✅   | ☐          |
| 2   | **Khả năng học hỏi**                | Tiếp thu nhanh kiến thức RDS, Secrets Manager, pgvector và Bedrock Mantle trong thời gian ngắn     | ☐   | ✅   | ☐          |
| 3   | **Chủ động**                        | Tự nghiên cứu cách sử dụng các cơ sở hạ tầng cần thiết trong đồ án | ✅   | ☐   | ☐          |
| 4   | **Tinh thần trách nhiệm**           | Hoàn thành worklog đúng hạn và đảm bảo tham gia đầy đủ các buổi học tập và sự kiện (khi được duyệt) | ✅   | ☐   | ☐          |
| 5   | **Kỷ luật**                         | Duy trì lịch học và thực hành đều đặn theo từng tuần trong 12 tuần                              | ✅   | ☐   | ☐          |
| 6   | **Tính cầu tiến**                   | Sẵn sàng điều chỉnh cấu hình RDS/S3/Secrets khi phát hiện vấn đề; học thêm best practices AWS  | ☐   | ✅   | ☐          |
| 7   | **Giao tiếp**                       | Trình bày và báo cáo đầy đủ và rõ ràng nội dung được đảm nhiệm         | ✅   | ☐   | ☐          |
| 8   | **Hợp tác nhóm**                    | Phối hợp và chia sẻ ý tưởng, kinh nghiệm với các thành viên trong nhóm   | ✅   | ☐   | ☐          |
| 9   | **Ứng xử chuyên nghiệp**            | Tôn trọng và hòa đồng với các thành viên nhóm, cũng như với mọi người trong môi trường làm việc   | ✅   | ☐   | ☐          |
| 10  | **Tư duy giải quyết vấn đề**        | Xử lý lỗi RDS connectivity, extension `vector`, Secrets get-value và embedding dimension mismatch | ☐   | ✅   | ☐          |
| 11  | **Đóng góp vào dự án**              | Triển khai thành công khối TV2 (S3 + RDS + Secrets + pgvector + Bedrock model access) cho ZeroBug Agent | ☐   | ✅   | ☐          |
| 12  | **Tổng thể**                        | Đánh giá chung về toàn bộ quá trình tham gia chương trình First Cloud AI Journey                | ☐   | ✅   | ☐          |

### Cần cải thiện

* Thay đổi phương pháp tự học để có thể hiểu rõ hơn về cơ sở hạ tầng AWS.
* Cải thiện kỹ năng triển khai cơ sở hạ tầng một cách mạch lạc.
* Nâng cao kỹ năng áp dụng hệ sinh thái AWS vào các đồ án khác.
