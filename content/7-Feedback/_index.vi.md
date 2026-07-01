---
title: "Chia sẻ, đóng góp ý kiến"
date: 2024-01-01
weight: 7
chapter: false
pre: " <b> 7. </b> "
---

> Đây là nơi tôi chia sẻ những trải nghiệm, cảm nhận và đóng góp ý kiến sau 12 tuần tham gia chương trình **First Cloud AI Journey** và thực hiện đồ án **ZeroBug Agent** trên nền tảng AWS.

### Đánh giá chung

**1. Chất lượng chương trình học**

Chương trình được thiết kế rất bài bản, từ kiến thức nền tảng (Free Tier, IAM, EC2, VPC, RDS, S3) cho đến các dịch vụ nâng cao (Bedrock, Lambda, Step Functions, Cognito, API Gateway). Lộ trình 12 tuần giúp tôi xây dựng kiến thức một cách có hệ thống, không bị ngợp bởi độ rộng của hệ sinh thái AWS. Đặc biệt, việc kết hợp lý thuyết với workshop thực hành giúp kiến thức được củng cố rất tốt.

**2. Tài liệu và nguồn học tập**

Tài liệu của chương trình chất lượng cao, viết rõ ràng và có hình ảnh minh họa chi tiết. Các workshop trên awsstudygroup.com được cập nhật thường xuyên và bám sát console AWS thực tế. Tuy nhiên, một số dịch vụ mới như **Amazon Bedrock AgentCore** chưa có tài liệu tiếng Việt đầy đủ, tôi phải tự tìm hiểu từ AWS documentation tiếng Anh.

**3. Sự phù hợp giữa chương trình và đồ án**

Các kiến thức học từ tuần 1 đến tuần 8 (IAM, EC2, RDS, S3, CloudFront...) đều được áp dụng trực tiếp vào kiến trúc ZeroBug Agent. Điều này tạo ra sự liên kết chặt chẽ giữa nội dung học và đồ án thực tế — tôi không chỉ học trên lý thuyết mà còn thực sự "hiểu tại sao" mỗi dịch vụ được chọn.

**4. Cơ hội học hỏi và phát triển kỹ năng**

12 tuần giúp tôi bước từ một người mới hoàn toàn với AWS đến người có thể thiết kế và triển khai một hệ thống đám mây production-grade. Đặc biệt, trải nghiệm tích hợp **Amazon Bedrock** và **Claude 3 Haiku** vào nghiệp vụ tự động sinh Unit Test là điểm nhấn kỹ thuật lớn nhất mà tôi có được từ chương trình.

**5. Thử thách và bài học lớn nhất**

- **Thách thức kỹ thuật khó nhất**: Cấu hình JWT Authorizer tích hợp đúng giữa Cognito User Pool và API Gateway, xử lý luồng token refresh cho SPA và đảm bảo CORS hoạt động trên cả môi trường dev lẫn production.
- **Bài học quan trọng nhất**: Không bao giờ hardcode Access Key vào mã nguồn. Luôn dùng IAM Role và Temporary Credentials. Đây là nguyên tắc bảo mật đám mây cốt lõi tôi sẽ mang theo trong toàn bộ sự nghiệp.

**6. Chính sách và phúc lợi**

Gói AWS Credit $200 được cung cấp thông qua chương trình là một phúc lợi rất thiết thực, giúp tôi thực hành mà không lo lắng về chi phí. Việc hướng dẫn rõ cách kiểm soát Budget và Billing Alerts từ đầu chương trình cũng giúp tôi tự tin thử nghiệm các dịch vụ mới.

---

### Một số câu hỏi thêm

- Điều bạn **hài lòng nhất** khi tham gia chương trình?

  → Được thực hành trực tiếp trên môi trường AWS thực, xây dựng một sản phẩm hoàn chỉnh có thể đưa vào portfolio.

- Điều bạn nghĩ chương trình **cần cải thiện**?

  → Có thể bổ sung thêm các buổi livestream Q&A hoặc office hours để người học có thể hỏi trực tiếp khi gặp vấn đề kỹ thuật phức tạp.

- Nếu giới thiệu cho bạn bè, bạn có **khuyên họ tham gia không**? Vì sao?

  → Có, tôi sẽ giới thiệu cho bất kỳ ai muốn học Cloud và AI một cách thực chiến, đặc biệt các bạn sinh viên CNTT muốn bổ sung kỹ năng cloud thực tế vào CV.

---

### Đề xuất và mong muốn

- Mong chương trình bổ sung thêm module về **Kubernetes trên AWS (EKS)** và **DevOps CI/CD** (CodePipeline, CodeBuild) để hoàn thiện kỹ năng cloud engineer.
- Mong có thêm nội dung hướng dẫn về **Multi-account AWS Organizations** và **AWS Control Tower** cho những ai muốn xây dựng hệ thống doanh nghiệp quy mô lớn.
- Tiếp tục duy trì chương trình và mở rộng ra nhiều trường đại học hơn để cộng đồng AWS tại Việt Nam ngày càng phát triển.
