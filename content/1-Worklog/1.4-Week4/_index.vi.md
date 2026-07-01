---
title: "Worklog Tuần 4"
date: 2026-01-01
weight: 4
chapter: false
pre: " <b> 1.4. </b> "
---

### Mục tiêu tuần 4:

* Nghiên cứu cơ chế cấp quyền cho ứng dụng truy cập các dịch vụ AWS thông qua AWS IAM.
* Phân tích rủi ro bảo mật của phương pháp sử dụng Access Key/Secret Access Key.
* Thực hành triển khai giải pháp bảo mật nâng cao bằng cách áp dụng IAM Role lên EC2 Instance.

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
      <td class="col-task">- Tiếp cận bài toán phân quyền cho ứng dụng khi tương tác với tài nguyên AWS <br> - Khởi tạo hạ tầng chuẩn bị: tạo EC2 Instance và S3 Bucket phục vụ bài thực hành</td>
      <td class="col-date">11/05/2026</td>
      <td class="col-date">11/05/2026</td>
      <td class="col-ref">https://000048.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">2</td>
      <td class="col-task">- Nghiên cứu phương pháp cấp quyền bằng Access Key: tạo IAM User và sinh cặp khóa Access Key / Secret Access Key</td>
      <td class="col-date">12/05/2026</td>
      <td class="col-date">12/05/2026</td>
      <td class="col-ref">https://000048.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">3</td>
      <td class="col-task">- Thực hành cấu hình và sử dụng Access Key để ứng dụng trên EC2 kết nối và tương tác với dữ liệu trong S3 Bucket</td>
      <td class="col-date">13/05/2026</td>
      <td class="col-date">13/05/2026</td>
      <td class="col-ref">https://000048.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">4</td>
      <td class="col-task">- Phân tích chuyên sâu rủi ro bảo mật khi lưu trữ Access Key trong mã nguồn <br> - Hiểu rõ tại sao không nên dùng Access Key tĩnh cho ứng dụng thực tế</td>
      <td class="col-date">14/05/2026</td>
      <td class="col-date">14/05/2026</td>
      <td class="col-ref">https://000048.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">5</td>
      <td class="col-task">- Nghiên cứu giải pháp an toàn hơn bằng IAM Role <br> - Tạo IAM Role mới với Policy phù hợp để truy cập S3 thay thế Access Key</td>
      <td class="col-date">15/05/2026</td>
      <td class="col-date">15/05/2026</td>
      <td class="col-ref">https://000048.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">6</td>
      <td class="col-task">- Gắn IAM Role vào EC2 Instance Profile <br> - Kiểm thử quyền truy cập từ EC2 lên S3 mà không cần cặp khóa tĩnh nào</td>
      <td class="col-date">16/05/2026</td>
      <td class="col-date">16/05/2026</td>
      <td class="col-ref">https://000048.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">7</td>
      <td class="col-task">- Đánh giá cơ chế Temporary Credentials tự động xoay vòng do IAM Role cung cấp <br> - Dọn dẹp toàn bộ tài nguyên đã tạo (EC2, S3, IAM) để tối ưu chi phí</td>
      <td class="col-date">17/05/2026</td>
      <td class="col-date">17/05/2026</td>
      <td class="col-ref">https://000048.awsstudygroup.com</td>
    </tr>
  </tbody>
</table>


### Kết quả đạt được tuần 4:

* Hiểu rõ và phân biệt được sự khác nhau về mức độ an toàn giữa Access Key (Tĩnh) và IAM Role (Động).
* Thành thạo kỹ năng khởi tạo, cấu hình và gắn IAM Role vào EC2 để cấp quyền truy cập tài nguyên an toàn.
* Áp dụng thành công tiêu chuẩn bảo mật đám mây, loại bỏ việc lưu Hardcode credentials trong mã nguồn.
* Hoàn thành quy trình dọn dẹp tài nguyên bài bản, bảo vệ tài khoản khỏi chi phí phát sinh ngoài ý muốn.
