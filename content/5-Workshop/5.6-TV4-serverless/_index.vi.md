---
title: "Hoa – Serverless"
date: 2024-01-01
weight: 6
chapter: false
pre: " <b> 5.6. </b> "
---

**Thành viên phụ trách:** Hoa  
**Phụ thuộc Trí + Kiệt:** NAT/Lambda-SG/Roles; S3, RDS, Secrets DB; Mantle model access.

#### Hoa làm gì?

Triển khai **6 Lambda functions**, **Step Functions state machine** và tích hợp **Bedrock Mantle** — khối AI pipeline sinh Unit Test.

#### Chức năng & dùng ở đâu

| Thành phần | Chức năng | Dùng ở đâu |
| --- | --- | --- |
| **Project Import** | Git/Zip → S3 | Bước đầu workflow import |
| **Context Builder** | Lọc file, prompt template | Trước khi gọi Bedrock Mantle |
| **Source File Service** | Cây thư mục / file từ S3 | IDE + workflow |
| **AI Invoke (Bedrock Mantle)** | Chat Completions `openai.gpt-oss-120b` | Bước Generate Test |
| **Result / History** | Lưu RDS | UI kết quả + lịch sử |
| **Step Functions** | Orchestration | EC2 `StartExecution` |

```
EC2 (Toàn) → Step Functions → Lambda chain → Bedrock Mantle (NAT → us-east-1) → S3 / RDS
```

#### Thiết kế AI

| Thành phần | Giá trị |
| --- | --- |
| Endpoint | `https://bedrock-mantle.us-east-1.api.aws/v1/chat/completions` |
| Model | `openai.gpt-oss-120b` |
| Auth | Bearer token — env `BEDROCK_MANTLE_API_KEY` trên Lambda **`BedrockInvokeLambda`** |
| Lambda region | `ap-southeast-1` (VPC + NAT) |
| Mantle region | `us-east-1` |

#### Chuẩn bị riêng Hoa

Thu thập từ [bảng tham số](../5.2-prerequisites/5.2.3-parameter-table/):

| Tham số | Nguồn |
| --- | --- |
| Private Subnet A/B, `zerobug-lambda-sg`, NAT Available | Trí |
| Role ARN Lambda + StepFn | Trí |
| S3, RDS endpoint, Secret DB, Mantle URL/model | Kiệt |

Chạy `build-all.bat` để có artifact deploy từng Lambda.

#### Nội dung triển khai

1. [Lambda — Context Builder](5.6.1-context-builder/)
2. [Lambda — Source File Service](5.6.2-source-file-service/)
3. [Lambda — AI Invoke (Bedrock Mantle)](5.6.3-ai-invoke-bedrock-mantle/)
4. [Lambda — Project Import](5.6.4-project-import/)
5. [Lambda — Result Service](5.6.5-result-service/)
6. [Lambda — History Service](5.6.6-history-service/)
7. [Step Functions State Machine](5.6.7-step-functions/)
8. [Kết nối EC2 invoke Step Functions](5.6.8-ec2-stepfn/)
9. [Giám sát & Debug](5.6.9-monitoring-debug/)
10. [Kiểm tra & bàn giao](5.6.10-verification-handoff/)

#### Bàn giao Toàn

**Step Functions State Machine ARN** → `cloud.env` trên EC2.
