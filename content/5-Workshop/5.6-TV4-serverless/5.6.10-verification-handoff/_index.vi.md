---
title: "Kiểm tra & bàn giao"
date: 2024-01-01
weight: 10
chapter: false
pre: " <b> 5.6.10. </b> "
---

#### Checklist Hoa

- [ ] 6 Lambda functions đã deploy (Context Builder, Source File, AI Invoke, Project Import, Result, History).
- [ ] Lambda gắn VPC (Private Subnet) + `zerobug-lambda-sg`.
- [ ] **`BedrockInvokeLambda`**: env `BEDROCK_MANTLE_API_KEY`; test invoke HTTP **200** từ Mantle.
- [ ] Step Functions state machine **Active**.
- [ ] Test execution thủ công trên Console (hoặc AWS CLI) — status **Succeeded** (khi backend sẵn sàng).
- [ ] CloudWatch Log groups có log từ Lambda + Step Functions.

#### Bàn giao Toàn (EC2)

| Tham số | Mô tả |
| --- | --- |
| **Step Functions State Machine ARN** | Thêm vào `cloud.env`: `STATE_MACHINE_ARN=arn:aws:states:ap-southeast-1:...` |
| Lambda function names | Tham chiếu trong state machine (Toàn không cần gọi trực tiếp) |

Spring Boot trên EC2 invoke Step Functions khi user bấm **Generate Test** — EC2 role `zerobug-ec2-role` (Trí) đã có quyền `states:StartExecution`.

#### Bàn giao cả nhóm

Cập nhật [bảng tham số](../../5.2-prerequisites/5.2.3-parameter-table/) — cột **Step Functions ARN**.

→ Tiếp theo: [Trinh — Xác thực & Edge](../../5.7-tv5-auth-edge/) (có thể làm song song nếu chưa có backend).
