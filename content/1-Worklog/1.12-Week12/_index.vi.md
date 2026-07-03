---
title: "Worklog Tuần 12"
date: 2026-01-01
weight: 12
chapter: false
pre: " <b> 1.12. </b> "
---

### Mục tiêu tuần 12:

* Hoàn thiện tài liệu và minh chứng triển khai **khối TV2** (S3, RDS, Secrets, pgvector, Bedrock).
* Chuẩn bị demo, báo cáo tốt nghiệp và dọn tài nguyên data layer theo Workshop mục 5.10.4.
* Nghiệm thu đồ án ZeroBug Agent cùng nhóm trước buổi bảo vệ.

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
      <td class="col-task">- Rà soát cuối cùng khối TV2: S3, RDS, Secret, pgvector, Bedrock model access hoạt động ổn định <br> - Xác nhận bảng tham số chung đầy đủ trước demo</td>
      <td class="col-date">06/07/2026</td>
      <td class="col-date">06/07/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">2</td>
      <td class="col-task">- Tổng hợp Deployment Guide phần Kiệt: S3, RDS, Secrets Manager, pgvector, Bedrock Mantle model access <br> - Chụp minh chứng RDS Console, Secrets, `\d code_embeddings`, Bedrock Model access</td>
      <td class="col-date">07/07/2026</td>
      <td class="col-date">07/07/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">3</td>
      <td class="col-task">- Viết chương báo cáo "Triển khai lớp dữ liệu & bí mật trên AWS" (TV2) <br> - Mô tả RAG gọn: pgvector `code_embeddings`, Mantle chat + embedding cross-region</td>
      <td class="col-date">08/07/2026</td>
      <td class="col-date">08/07/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">4</td>
      <td class="col-task">- Chuẩn bị slide: vai trò TV2, sơ đồ data flow S3 → RDS → Bedrock Mantle <br> - Quay video demo ngắn phần hạ tầng dữ liệu làm phụ lục</td>
      <td class="col-date">09/07/2026</td>
      <td class="col-date">09/07/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">5</td>
      <td class="col-task">- Dry Run bảo vệ: câu hỏi về RDS private subnet, Secrets Manager, pgvector, Bedrock model access <br> - Giải thích vì sao schema ứng dụng do Toàn (JPA) tạo, vector table do Kiệt tạo</td>
      <td class="col-date">10/07/2026</td>
      <td class="col-date">10/07/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">6</td>
      <td class="col-task">- Kiểm tra data layer sẵn sàng Live Demo; xác nhận RDS metrics và S3 bucket còn dữ liệu demo <br> - Lập checklist dọn tài nguyên Kiệt: RDS → Subnet Group → Secrets → S3 empty + delete</td>
      <td class="col-date">11/07/2026</td>
      <td class="col-date">11/07/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">7</td>
      <td class="col-task">- Hoàn thành báo cáo, slide và lưu mã nguồn/tài liệu Workshop lên Git <br> - Sau nghiệm thu: dọn RDS, DB Subnet Group, Secret `zerobug/rds/credentials`, S3 bucket theo thứ tự 5.10.4</td>
      <td class="col-date">12/07/2026</td>
      <td class="col-date">12/07/2026</td>
      <td class="col-ref"></td>
    </tr>
  </tbody>
</table>


### Kết quả đạt được tuần 12:

* Hoàn thiện tài liệu triển khai và báo cáo phần TV2 — Lớp dữ liệu & bí mật.
* Demo ZeroBug Agent ổn định; sẵn sàng trả lời phản biện về S3, RDS, Secrets, pgvector và Bedrock Mantle.
* Dọn dẹp tài nguyên data layer đúng quy trình Workshop, tránh phát sinh chi phí RDS/S3 sau nghiệm thu.
