---
title: "Worklog Tuần 3"
date: 2026-01-01
weight: 3
chapter: false
pre: " <b> 1.3. </b> "
---

### Mục tiêu tuần 3:

* Nghiên cứu và thực hành xây dựng môi trường mạng an toàn với Amazon VPC và AWS Site-to-Site VPN.
* Tìm hiểu chuyên sâu về dịch vụ máy chủ ảo Amazon EC2 trên cả hai hệ điều hành Windows và Linux.
* Triển khai ứng dụng thực tế và áp dụng các quy chuẩn quản trị chi phí, dọn dẹp tài nguyên.

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
      <td class="col-task">- Tiếp cận kiến thức nền tảng về Amazon VPC <br> - Tìm hiểu multi-AZ NAT Gateways, VPC Flow Logs, CloudWatch monitoring và Systems Manager Session Manager</td>
      <td class="col-date">04/05/2026</td>
      <td class="col-date">04/05/2026</td>
      <td class="col-ref">https://000003.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">2</td>
      <td class="col-task">- Thiết lập tường lửa trong VPC: phân biệt và cấu hình Security Groups và Network ACLs <br> - Chuẩn bị và triển khai EC2 vào kiến trúc VPC vừa tạo</td>
      <td class="col-date">05/05/2026</td>
      <td class="col-date">05/05/2026</td>
      <td class="col-ref">https://000003.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">3</td>
      <td class="col-task">- Cấu hình kết nối AWS Site-to-Site VPN thiết lập đường truyền mã hóa giữa On-premises và AWS <br> - Tiếp cận giải pháp tự động hóa hạ tầng qua Infrastructure as Code (IaC) Templates</td>
      <td class="col-date">06/05/2026</td>
      <td class="col-date">06/05/2026</td>
      <td class="col-ref">https://000003.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">4</td>
      <td class="col-task">- Tìm hiểu Amazon EC2: tổng quan, cơ chế hoạt động và các tính năng cốt lõi của máy chủ ảo <br> - Nghiên cứu các tiêu chuẩn bảo mật cấu hình và phân quyền IAM an toàn cho EC2</td>
      <td class="col-date">07/05/2026</td>
      <td class="col-date">07/05/2026</td>
      <td class="col-ref">https://000004.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">5</td>
      <td class="col-task">- Thực hành khởi chạy Instance trên hệ điều hành Microsoft Windows Server 2025 <br> - Thực hành khởi chạy Instance trên hệ điều hành Amazon Linux 2023</td>
      <td class="col-date">08/05/2026</td>
      <td class="col-date">08/05/2026</td>
      <td class="col-ref">https://000004.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">6</td>
      <td class="col-task">- Triển khai ứng dụng Node.js "AWS User Management" (CRUD) trên Amazon Linux 2023 <br> - Triển khai ứng dụng tương tự trên EC2 Windows để so sánh quy trình vận hành</td>
      <td class="col-date">09/05/2026</td>
      <td class="col-date">09/05/2026</td>
      <td class="col-ref">https://000004.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">7</td>
      <td class="col-task">- Học cách quản trị chi phí và kiểm soát sử dụng EC2 bằng IAM <br> - Thực hiện dọn dẹp tài nguyên (VPC và EC2) để tránh phát sinh chi phí ngoài ý muốn</td>
      <td class="col-date">10/05/2026</td>
      <td class="col-date">10/05/2026</td>
      <td class="col-ref">https://000004.awsstudygroup.com</td>
    </tr>
  </tbody>
</table>


### Kết quả đạt được tuần 3:

* Thiết kế và triển khai thành công hạ tầng mạng VPC hoàn chỉnh với bảo mật đa tầng SG/NACL và kết nối VPN Hybrid.
* Làm chủ quy trình khởi tạo, cấu hình và quản lý EC2 trên cả Windows Server 2025 và Amazon Linux 2023.
* Triển khai thành công ứng dụng Full-stack Node.js CRUD lên EC2 và biết cách đóng gói hạ tầng bằng IaC.
* Ý thức rõ cơ chế tính phí EC2/VPC và thành thạo kỹ năng dọn dẹp tài nguyên để tối ưu ngân sách.
