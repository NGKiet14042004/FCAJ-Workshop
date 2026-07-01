---
title: "Worklog Tuần 11"
date: 2026-01-01
weight: 11
chapter: false
pre: " <b> 1.11. </b> "
---

### Mục tiêu tuần 11:

* Thực hiện kiểm thử toàn diện hệ thống (Integration & Performance Testing) trên môi trường AWS.
* Cấu hình các dịch vụ giám sát, cảnh báo lỗi và tối ưu hóa hiệu năng, chi phí cho hệ thống đám mây.
* Sửa các lỗi phát sinh (Bug fixing) trong quá trình vận hành thực tế.

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
      <td class="col-task">- Tiến hành Integration Testing: đảm bảo luồng dữ liệu giữa Client, App Server và Database không bị lỗi <br> - Kiểm tra cơ chế phân quyền, xác thực người dùng và bảo mật API trên AWS</td>
      <td class="col-date">29/06/2026</td>
      <td class="col-date">29/06/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">2</td>
      <td class="col-task">- Sử dụng Amazon CloudWatch thiết lập biểu đồ giám sát tài nguyên (CPU, RAM, Storage, Network) <br> - Cấu hình AWS Budget và CloudWatch Alarms gửi cảnh báo tự động khi vượt ngưỡng an toàn</td>
      <td class="col-date">30/06/2026</td>
      <td class="col-date">30/06/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">3</td>
      <td class="col-task">- Thực hiện Load Testing hoặc giả lập kịch bản truy cập đồng thời để đánh giá khả năng chịu tải EC2 <br> - Ghi nhận Bottlenecks hệ thống qua CloudWatch Logs</td>
      <td class="col-date">01/07/2026</td>
      <td class="col-date">01/07/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">4</td>
      <td class="col-task">- Tối ưu hóa hiệu năng mã nguồn Back-end và các câu lệnh truy vấn dữ liệu <br> - Áp dụng Cost Optimization: tắt hoặc giảm cấu hình tài nguyên không sử dụng</td>
      <td class="col-date">02/07/2026</td>
      <td class="col-date">02/07/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">5</td>
      <td class="col-task">- Sửa chữa lỗi logic, lỗi giao diện hoặc lỗi kết nối phát sinh từ môi trường Cloud <br> - Kiểm tra tính ổn định của các tính năng nâng cao trong đồ án (AI generation, lịch sử, monitor)</td>
      <td class="col-date">03/07/2026</td>
      <td class="col-date">03/07/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">6</td>
      <td class="col-task">- Sao lưu dữ liệu toàn diện: tạo Amazon Machine Images (AMI) cho EC2 <br> - Tạo Snapshot cho RDS làm phương án dự phòng (Backup)</td>
      <td class="col-date">04/07/2026</td>
      <td class="col-date">04/07/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">7</td>
      <td class="col-task">- Chạy lại toàn bộ kịch bản kiểm thử (Regression Testing) để xác nhận hệ thống không còn lỗi nghiêm trọng <br> - Xác nhận trạng thái sẵn sàng cao nhất của hệ thống</td>
      <td class="col-date">05/07/2026</td>
      <td class="col-date">05/07/2026</td>
      <td class="col-ref"></td>
    </tr>
  </tbody>
</table>


### Kết quả đạt được tuần 11:

* Hệ thống đồ án được tối ưu hóa hiệu năng, hoạt động trơn tru dưới các kịch bản kiểm thử khác nhau.
* Làm chủ CloudWatch phục vụ giám sát log và thiết lập thành công cơ chế cảnh báo tài chính/hiệu năng tự động.
* Khắc phục triệt để lỗi vận hành đám mây, hoàn thành bộ dữ liệu backup an toàn cho toàn bộ kiến trúc.
