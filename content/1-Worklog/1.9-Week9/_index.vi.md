---
title: "Worklog Tuần 9"
date: 2026-01-01
weight: 9
chapter: false
pre: " <b> 1.9. </b> "
---

### Mục tiêu tuần 9:

* Nghiên cứu và lên ý tưởng tổng quan cho đồ án tốt nghiệp ZeroBug Agent, xác định bài toán và công nghệ cốt lõi.
* Thiết kế sơ đồ kiến trúc hệ thống (System Architecture Diagram) tối ưu, an toàn và có khả năng mở rộng.
* Xác định phân công nhóm và khối **TV2 — Lớp dữ liệu & bí mật** (S3, RDS, Secrets, pgvector, Bedrock model access) do Kiệt phụ trách.

### Các công việc cần triển khai trong tuần này:
<table class="worklog-table">
<colgroup>
  <col class="col-day" style="width:5%">
  <col class="col-task" style="width:42%">
  <col class="col-start" style="width:13%">
  <col class="col-end" style="width:13%">
  <col class="col-ref" style="width:27%">
</colgroup>
  <thead>
    <tr>
      <th>Ngày</th>
      <th>Công việc</th>
      <th>Ngày bắt đầu</th>
      <th>Ngày hoàn thành</th>
      <th>Nguồn tài liệu</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td class="col-day">1</td>
      <td class="col-task">- Khảo sát đề tài ZeroBug Agent, phân tích nhu cầu sinh Unit Test bằng AI <br> - Xác định luồng: Import source → Context Builder (RAG) → Bedrock Mantle chat</td>
      <td class="col-date">15/06/2026</td>
      <td class="col-date">15/06/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">2</td>
      <td class="col-task">- Phác thảo luồng dữ liệu (Data Flow): S3 source → Lambda embed → RDS pgvector → chat Mantle <br> - Phân công 5 thành viên: Trí → Kiệt → Toàn → Hoa → Trinh</td>
      <td class="col-date">16/06/2026</td>
      <td class="col-date">16/06/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">3</td>
      <td class="col-task">- Thiết kế sơ đồ kiến trúc tổng thể (High-Level Architecture) <br> - Định hình Public/Private Subnets; RDS đặt Private Subnet (phụ thuộc Trí hoàn thành VPC trước)</td>
      <td class="col-date">17/06/2026</td>
      <td class="col-date">17/06/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">4</td>
      <td class="col-task">- Lựa chọn RDS PostgreSQL 15.x + pgvector cho RAG gọn (bảng `code_embeddings`, dimension 1024) <br> - Thiết kế S3 bucket private lưu source và prefix `deploy/` cho JAR</td>
      <td class="col-date">18/06/2026</td>
      <td class="col-date">18/06/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">5</td>
      <td class="col-task">- Nghiên cứu Bedrock Mantle (`us-east-1`): model chat `openai.gpt-oss-120b` và embedding `cohere.embed-multilingual-v3` <br> - Lập kế hoạch Secrets Manager lưu credential RDS (`zerobug/rds/credentials`)</td>
      <td class="col-date">19/06/2026</td>
      <td class="col-date">19/06/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">6</td>
      <td class="col-task">- Soạn bảng tham số chung (S3, RDS endpoint, Secret ARN, Mantle URL/model, bảng vector) <br> - Ước tính chi phí RDS, NAT, Bedrock inference; đối chiếu Free Tier</td>
      <td class="col-date">20/06/2026</td>
      <td class="col-date">20/06/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">7</td>
      <td class="col-task">- Hoàn thiện tài liệu kiến trúc và checklist triển khai TV2 (mục 5.4 Workshop) <br> - Chuẩn bị bàn giao: Kiệt triển khai sau khi Trí xong IAM + VPC</td>
      <td class="col-date">21/06/2026</td>
      <td class="col-date">21/06/2026</td>
      <td class="col-ref"></td>
    </tr>
  </tbody>
</table>


### Kết quả đạt được tuần 9:

* Định hình rõ ràng đề tài ZeroBug Agent với pipeline RAG gọn trên RDS pgvector.
* Hoàn thành sơ đồ kiến trúc và phân công: Kiệt phụ trách TV2 (S3 + RDS + Secrets + pgvector + Bedrock model access).
* Xác lập danh sách tham số bàn giao cho Toàn (S3, RDS, Secret) và Hoa (Mantle URL/model, bảng `code_embeddings`).
* Sẵn sàng bước vào giai đoạn triển khai hạ tầng theo thứ tự Trí → Kiệt → Toàn → Hoa → Trinh.
