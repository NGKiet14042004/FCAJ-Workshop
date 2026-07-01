---
title: "Worklog Tuần 7"
date: 2026-01-01
weight: 7
chapter: false
pre: " <b> 1.7. </b> "
---

### Mục tiêu tuần 7:

* Nghiên cứu dịch vụ cơ sở dữ liệu quan hệ được quản lý Amazon RDS.
* Tìm hiểu các cơ chế lưu trữ, bảo mật, High Availability (Multi-AZ) và khả năng sao lưu phục hồi.
* Thực hành kết nối máy chủ EC2 với cơ sở dữ liệu RDS và triển khai ứng dụng thực tế.

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
      <td class="col-task">- Tìm hiểu tổng quan Amazon RDS: lợi ích Managed Service (tự động backup, vá lỗi, scale) <br> - Phân biệt các Database Engines hỗ trợ (Aurora, MySQL, PostgreSQL, SQL Server...)</td>
      <td class="col-date">01/06/2026</td>
      <td class="col-date">01/06/2026</td>
      <td class="col-ref">https://000005.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">2</td>
      <td class="col-task">- Nghiên cứu tùy chọn lưu trữ: General Purpose SSD (gp2/gp3) và Provisioned IOPS SSD (io1/io2) <br> - Tìm hiểu High Availability qua Multi-AZ (failover tự động 60-120s) và Read Replicas</td>
      <td class="col-date">02/06/2026</td>
      <td class="col-date">02/06/2026</td>
      <td class="col-ref">https://000005.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">3</td>
      <td class="col-task">- Nghiên cứu bảo mật RDS: mã hóa AWS KMS, cô lập mạng VPC, phân quyền IAM, SSL/TLS <br> - Tìm hiểu cơ chế sao lưu: Automated Backups (35 ngày) và Manual Snapshots</td>
      <td class="col-date">03/06/2026</td>
      <td class="col-date">03/06/2026</td>
      <td class="col-ref">https://000005.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">4</td>
      <td class="col-task">- Thực hiện chuẩn bị hạ tầng: khởi tạo VPC, EC2 Security Group, RDS Security Group và DB Subnet Group</td>
      <td class="col-date">04/06/2026</td>
      <td class="col-date">04/06/2026</td>
      <td class="col-ref">https://000005.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">5</td>
      <td class="col-task">- Thực hành khởi tạo Amazon EC2 Instance đóng vai trò Application Server <br> - Thực hành khởi tạo RDS Database Instance (chọn Engine, thiết lập Storage và cấu hình mạng)</td>
      <td class="col-date">05/06/2026</td>
      <td class="col-date">05/06/2026</td>
      <td class="col-ref">https://000005.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">6</td>
      <td class="col-task">- Triển khai ứng dụng: cấu hình kết nối từ EC2 tới RDS; thực hiện các truy vấn SQL cơ bản <br> - Thực hành Backup và Restore dữ liệu trên RDS</td>
      <td class="col-date">06/06/2026</td>
      <td class="col-date">06/06/2026</td>
      <td class="col-ref">https://000005.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">7</td>
      <td class="col-task">- Dọn dẹp tài nguyên: xóa RDS DB Instance, EC2 Instance và các cấu hình mạng liên quan <br> - Tránh phát sinh chi phí ngoài ý muốn trên tài khoản Free Tier</td>
      <td class="col-date">07/06/2026</td>
      <td class="col-date">07/06/2026</td>
      <td class="col-ref">https://000005.awsstudygroup.com</td>
    </tr>
  </tbody>
</table>


### Kết quả đạt được tuần 7:

* Hiểu rõ nguyên lý hoạt động, kiến trúc bảo mật và giải pháp High Availability (Multi-AZ, Read Replicas) của Amazon RDS.
* Thành thạo cấu hình môi trường mạng (Subnet Group, Security Group) để cô lập và bảo vệ cơ sở dữ liệu.
* Triển khai kết nối thành công từ EC2 đến RDS, đảm bảo tính toàn vẹn và an toàn dữ liệu.
* Nắm vững quy trình sao lưu snapshot và dọn dẹp hạ tầng DB đúng cách để kiểm soát ngân sách đám mây.
