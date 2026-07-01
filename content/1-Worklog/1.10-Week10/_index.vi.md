---
title: "Worklog Tuần 10"
date: 2026-01-01
weight: 10
chapter: false
pre: " <b> 1.10. </b> "
---

### Mục tiêu tuần 10:

* Khởi tạo và cấu hình các dịch vụ hạ tầng AWS cốt lõi theo sơ đồ kiến trúc đã thiết kế.
* Triển khai mã nguồn ứng dụng (Back-end và Front-end) lên môi trường đám mây.
* Thiết lập kết nối an toàn giữa máy chủ ứng dụng và hệ quản trị cơ sở dữ liệu trên AWS.

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
      <td class="col-task">- Cấu hình môi trường mạng an toàn: tạo VPC, Public/Private Subnets, Internet Gateway và NAT Gateway <br> - Thiết lập Security Groups và Network ACLs kiểm soát luồng traffic</td>
      <td class="col-date">22/06/2026</td>
      <td class="col-date">22/06/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">2</td>
      <td class="col-task">- Khởi tạo Amazon RDS trong Private Subnet để đảm bảo an toàn dữ liệu <br> - Cấu hình tài khoản truy cập, phân quyền và import schema/seed data vào database</td>
      <td class="col-date">23/06/2026</td>
      <td class="col-date">23/06/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">3</td>
      <td class="col-task">- Khởi tạo Amazon EC2 Instance làm Application Server <br> - Cấu hình Runtime environment, cài đặt công cụ bổ trợ và AWS CLI trên máy chủ</td>
      <td class="col-date">24/06/2026</td>
      <td class="col-date">24/06/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">4</td>
      <td class="col-task">- Đóng gói và triển khai mã nguồn Back-end lên AWS <br> - Cấu hình biến môi trường và Connection String an toàn từ máy chủ tới RDS</td>
      <td class="col-date">25/06/2026</td>
      <td class="col-date">25/06/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">5</td>
      <td class="col-task">- Triển khai phần Front-end (host static files trên S3 + CloudFront hoặc AWS Amplify) <br> - Cấu hình đường dẫn API từ Front-end về đúng địa chỉ Back-end trên AWS</td>
      <td class="col-date">26/06/2026</td>
      <td class="col-date">26/06/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">6</td>
      <td class="col-task">- Cấu hình phân quyền nâng cao với IAM Roles, loại bỏ Access Key tĩnh trong mã nguồn <br> - Upload media (hình ảnh, tài liệu) lên S3 Bucket và kiểm tra quyền truy cập</td>
      <td class="col-date">27/06/2026</td>
      <td class="col-date">27/06/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">7</td>
      <td class="col-task">- Chạy thử nghiệm End-to-End toàn bộ ứng dụng trên môi trường Cloud <br> - Đảm bảo các dịch vụ AWS phối hợp hoạt động mượt mà</td>
      <td class="col-date">28/06/2026</td>
      <td class="col-date">28/06/2026</td>
      <td class="col-ref"></td>
    </tr>
  </tbody>
</table>


### Kết quả đạt được tuần 10:

* Xây dựng thành công hạ tầng mạng và lưu trữ an toàn trên AWS cho đồ án tốt nghiệp.
* Triển khai đồng bộ Front-end và Back-end lên đám mây, kích hoạt cơ sở dữ liệu được quản lý hoàn toàn.
* Hệ thống chạy ổn định, các thành phần kết nối chính xác và tuân thủ nguyên tắc bảo mật tài khoản.
