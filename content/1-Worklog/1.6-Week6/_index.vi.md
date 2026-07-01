---
title: "Worklog Tuần 6"
date: 2026-01-01
weight: 6
chapter: false
pre: " <b> 1.6. </b> "
---

### Mục tiêu tuần 6:

* Nghiên cứu dịch vụ lưu trữ đối tượng Amazon S3 và các tính năng cốt lõi.
* Thực hành cấu hình Static Website Hosting kết hợp tối ưu hóa hiệu năng bằng Amazon CloudFront.
* Triển khai các cơ chế quản lý dữ liệu nâng cao: Bucket Versioning, Object Migration và Cross-Region Replication.

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
      <td class="col-task">- Tìm hiểu tổng quan Amazon S3: đặc tính kỹ thuật (độ bền 99.999999999%), các case sử dụng thực tế <br> - Nghiên cứu AWS Amplify Hosting thay thế host website tĩnh truyền thống</td>
      <td class="col-date">25/05/2026</td>
      <td class="col-date">25/05/2026</td>
      <td class="col-ref">https://000057.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">2</td>
      <td class="col-task">- Thực hành bước chuẩn bị: khởi tạo S3 Bucket mới <br> - Tải dữ liệu mã nguồn website lên hệ thống lưu trữ S3</td>
      <td class="col-date">26/05/2026</td>
      <td class="col-date">26/05/2026</td>
      <td class="col-ref">https://000057.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">3</td>
      <td class="col-task">- Kích hoạt Static Website Hosting trên S3 Bucket <br> - Cấu hình Public Access Block và Public Objects permission; tiến hành kiểm thử website</td>
      <td class="col-date">27/05/2026</td>
      <td class="col-date">27/05/2026</td>
      <td class="col-ref">https://000057.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">4</td>
      <td class="col-task">- Cấu hình Amazon CloudFront CDN để tăng tốc website tĩnh <br> - Đóng quyền Public Access S3, chỉ cho phép CloudFront truy cập qua OAI/OAC; kiểm thử lại</td>
      <td class="col-date">28/05/2026</td>
      <td class="col-date">28/05/2026</td>
      <td class="col-ref">https://000057.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">5</td>
      <td class="col-task">- Nghiên cứu và thực hành Bucket Versioning để bảo vệ dữ liệu chống ghi đè hoặc xóa nhầm <br> - Thao tác di chuyển đối tượng (Move objects) giữa các thư mục hoặc Storage Class</td>
      <td class="col-date">29/05/2026</td>
      <td class="col-date">29/05/2026</td>
      <td class="col-ref">https://000057.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">6</td>
      <td class="col-task">- Cấu hình sao chép dữ liệu đa vùng (Replication Object multi Region) để đảm bảo High Availability và Disaster Recovery <br> - Đúc kết Notes & Best Practices với dịch vụ S3</td>
      <td class="col-date">30/05/2026</td>
      <td class="col-date">30/05/2026</td>
      <td class="col-ref">https://000057.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">7</td>
      <td class="col-task">- Dọn dẹp tài nguyên: xóa S3 Buckets và CloudFront Distributions đã tạo trong tuần <br> - Bảo vệ hạn mức tài khoản Free Tier</td>
      <td class="col-date">31/05/2026</td>
      <td class="col-date">31/05/2026</td>
      <td class="col-ref">https://000057.awsstudygroup.com</td>
    </tr>
  </tbody>
</table>


### Kết quả đạt được tuần 6:

* Nắm vững kiến thức nền tảng về cơ chế lưu trữ đối tượng S3 và xu hướng triển khai web hiện đại với Amplify.
* Thành thạo cấu hình và bảo mật Static Website Host trên S3, kết hợp CloudFront để tăng tốc và bảo mật hạ tầng.
* Làm chủ kỹ thuật quản lý vòng đời dữ liệu: Versioning, Migration và Multi-Region Replication.
* Tuân thủ quy trình dọn dẹp hạ tầng S3/CloudFront chuẩn xác, kiểm soát tốt chi phí sử dụng.
