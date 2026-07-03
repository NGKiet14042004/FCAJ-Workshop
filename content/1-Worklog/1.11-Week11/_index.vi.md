---
title: "Worklog Tuần 11"
date: 2026-01-01
weight: 11
chapter: false
pre: " <b> 1.11. </b> "
---

### Mục tiêu tuần 11:

* Giám sát và kiểm thử khối dữ liệu TV2 (S3, RDS, Secrets, pgvector, Bedrock model access) trên môi trường nhóm.
* Cấu hình CloudWatch cho RDS, test Secrets get-value và debug pgvector khi tích hợp Lambda/EC2.
* Hỗ trợ nhóm xử lý lỗi liên quan DB, Secret và embedding dimension trong kịch bản E2E.

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
      <td class="col-task">- Xác nhận checklist E2E phần Kiệt: S3 upload OK; RDS Available; Secret DB; pgvector + `code_embeddings`; Bedrock model access <br> - Phối hợp nhóm chạy luồng Step Functions sau khi Toàn/Hoa triển khai xong</td>
      <td class="col-date">29/06/2026</td>
      <td class="col-date">29/06/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">2</td>
      <td class="col-task">- Thiết lập CloudWatch metrics cho RDS (`CPUUtilization`, connections) <br> - Test Secrets get-value từ role EC2/Lambda; cấu hình alarm RDS CPU > 80%</td>
      <td class="col-date">30/06/2026</td>
      <td class="col-date">30/06/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">3</td>
      <td class="col-task">- Kiểm tra pgvector trên psql: `\dx` (extension vector), `\d code_embeddings` <br> - Debug lỗi `extension "vector" does not exist` hoặc dimension mismatch (1024)</td>
      <td class="col-date">01/07/2026</td>
      <td class="col-date">01/07/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">4</td>
      <td class="col-task">- Kiểm tra kết nối RDS từ EC2 (Toàn) và Lambda (Hoa) qua Secret — không hardcode password <br> - Rà soát chi phí RDS và Bedrock inference trên Cost Explorer</td>
      <td class="col-date">02/07/2026</td>
      <td class="col-date">02/07/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">5</td>
      <td class="col-task">- Hỗ trợ debug Bedrock Mantle: model access denied, embedding 400, timeout cross-region qua NAT <br> - Xác nhận model `cohere.embed-multilingual-v3` và dimension 1024 khớp bảng `code_embeddings`</td>
      <td class="col-date">03/07/2026</td>
      <td class="col-date">03/07/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">6</td>
      <td class="col-task">- Tạo RDS Snapshot làm phương án backup dữ liệu metadata và vector RAG <br> - Kiểm tra S3 bucket còn object source và prefix `deploy/` cho JAR</td>
      <td class="col-date">04/07/2026</td>
      <td class="col-date">04/07/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">7</td>
      <td class="col-task">- Chạy Regression Testing phần data layer cùng nhóm (E2E checklist 5.8) <br> - Xác nhận khối TV2 ổn định trước giai đoạn hoàn thiện và demo</td>
      <td class="col-date">05/07/2026</td>
      <td class="col-date">05/07/2026</td>
      <td class="col-ref"></td>
    </tr>
  </tbody>
</table>


### Kết quả đạt được tuần 11:

* Khối TV2 (S3, RDS, Secrets, pgvector, Bedrock model access) vận hành ổn định trên môi trường nhóm.
* Thiết lập giám sát RDS và test Secrets thành công; xử lý được lỗi pgvector/embedding dimension.
* Hoàn thành RDS Snapshot backup; sẵn sàng hỗ trợ demo và giai đoạn dọn tài nguyên tuần 12.
