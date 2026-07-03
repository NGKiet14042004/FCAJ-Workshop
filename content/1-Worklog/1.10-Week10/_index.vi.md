---
title: "Worklog Tuần 10"
date: 2026-01-01
weight: 10
chapter: false
pre: " <b> 1.10. </b> "
---

### Mục tiêu tuần 10:

* Triển khai **khối TV2 — Lớp dữ liệu & bí mật** cho ZeroBug Agent theo Workshop mục 5.4.
* Thiết lập S3, RDS PostgreSQL, Secrets Manager, pgvector và bật Bedrock Mantle model access.
* Hoàn thành checklist kiểm tra và bàn giao tham số cho Toàn và Hoa.

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
      <td class="col-task">- Nhận bàn giao từ Trí: Private Subnet A/B, `zerobug-rds-sg`, ARN `zerobug-ec2-role` & `zerobug-lambda-role` <br> - Rà soát bảng tham số chung và chuẩn bị triển khai TV2</td>
      <td class="col-date">22/06/2026</td>
      <td class="col-date">22/06/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">2</td>
      <td class="col-task">- Tạo S3 bucket private `zerobug-projects-<suffix>` (ap-southeast-1), bật Block Public Access <br> - Test upload/download; ghi tên bucket vào bảng tham số</td>
      <td class="col-date">23/06/2026</td>
      <td class="col-date">23/06/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">3</td>
      <td class="col-task">- Tạo DB Subnet Group và RDS PostgreSQL 15.x (`zerobug-db`) trong Private Subnet, Public access = No <br> - Copy RDS endpoint; DB name `zerobug`</td>
      <td class="col-date">24/06/2026</td>
      <td class="col-date">24/06/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">4</td>
      <td class="col-task">- Lưu credential RDS vào Secrets Manager (`zerobug/rds/credentials`), copy Secret ARN <br> - Chạy SQL pgvector: `CREATE EXTENSION vector` + bảng `code_embeddings` (vector 1024)</td>
      <td class="col-date">25/06/2026</td>
      <td class="col-date">25/06/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">5</td>
      <td class="col-task">- Bật Bedrock Mantle model access region `us-east-1`: `openai.gpt-oss-120b` và `cohere.embed-multilingual-v3` <br> - Ghi Mantle base URL, model ID, embedding dimension vào bảng tham số</td>
      <td class="col-date">26/06/2026</td>
      <td class="col-date">26/06/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">6</td>
      <td class="col-task">- Chạy checklist xác nhận TV2: S3, RDS Available, Secret, pgvector, Bedrock Access granted <br> - Không tạo bảng ứng dụng bằng tay — để Toàn deploy JPA (`ddl-auto=update`)</td>
      <td class="col-date">27/06/2026</td>
      <td class="col-date">27/06/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">7</td>
      <td class="col-task">- Bàn giao Toàn: S3 bucket, RDS endpoint, Secret ARN DB <br> - Bàn giao Hoa: S3, Secret DB, RDS endpoint, Mantle URL/model, bảng `code_embeddings`, RAG top-k</td>
      <td class="col-date">28/06/2026</td>
      <td class="col-date">28/06/2026</td>
      <td class="col-ref"></td>
    </tr>
  </tbody>
</table>


### Kết quả đạt được tuần 10:

* Hoàn thành khối TV2: S3 private, RDS PostgreSQL, Secrets Manager, pgvector + `code_embeddings`.
* Bật thành công Bedrock Mantle model access (chat + embedding) ở `us-east-1`.
* Bảng tham số chung đã điền đủ; bàn giao thành công cho Toàn và Hoa theo checklist Workshop.
