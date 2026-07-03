---
title: "Bản đề xuất"
date: 2024-01-01
weight: 2
chapter: false
pre: " <b> 2. </b> "
---

# ZeroBug Agent
## Nền tảng AI sinh Unit Test tự động trên AWS

---

### 1. Tổng quan đề tài

**ZeroBug Agent** là hệ thống AI trên nền tảng Amazon Web Services (AWS), hỗ trợ tự động sinh Unit Test từ mã nguồn dự án. Hệ thống hỗ trợ ba ngôn ngữ trọng tâm: **Java** (JUnit 5 + Mockito), **Python** (pytest) và **C# / .NET** (xUnit).

Thay vì chỉ gửi một file code rời rạc cho AI, người dùng import toàn bộ dự án (Git hoặc Zip), duyệt cây thư mục trên giao diện IDE, mô tả yêu cầu kiểm thử bằng ngôn ngữ tự nhiên. Backend thu thập các file source liên quan theo loại ngôn ngữ, đóng gói ngữ cảnh (context) và gửi tới Amazon Bedrock (Claude 3 Haiku) để sinh mã test.

**Mục tiêu chính:**

- Giảm thời gian viết Unit Test cho developer / QA.
- Tăng gợi ý test case nhờ AI với ngữ cảnh nhiều file liên quan.
- Trải nghiệm gần IDE: xem source, sinh test, copy kết quả.
- Triển khai production trên AWS với bảo mật và giám sát đầy đủ.
- Desktop client (Electron) cho người dùng cuối — chỉ cần WiFi và cài app.

**Phạm vi đồ án:**

- Sinh Unit Test (chưa tự động chạy test suite trên CI).
- Ngôn ngữ: Java, Python, .NET (C#).
- Import project qua Git public hoặc Upload Zip.
- Kiến trúc: Frontend (Vite SPA / Electron) + Backend (Spring Boot trên EC2 trong VPC) + AWS Step Functions (orchestration) + AWS Lambda + các dịch vụ AWS (Route 53, CloudFront, WAF, API Gateway, ALB, Cognito, S3, RDS, Bedrock, Secrets Manager, CloudWatch, SNS, Budgets, IAM).

**Đối tượng sử dụng:**

- Developer / sinh viên cần bộ test khởi đầu nhanh.
- Admin quản trị hệ thống và theo dõi trạng thái dịch vụ AWS.

---

### 2. Mô tả nghiệp vụ

#### 2.1. Luồng nghiệp vụ tổng quát

```
Đăng ký / Đăng nhập (Amazon Cognito)
  → Tạo dự án (chọn ngôn ngữ: Java / Python / .NET; Import Git hoặc Zip)
  → Mở IDE (Explorer + Monaco Editor)
  → Nhập yêu cầu kiểm thử
  → Generate Test (Step Functions → Lambda + Bedrock)
  → Xem / Copy kết quả; lịch sử lưu trên RDS
```

**Luồng truy cập hạ tầng:**

```
[Electron Desktop Client / Web Browser (Vite SPA)]
      ↓
[Amazon Route 53 — DNS]
      ↓
[Amazon CloudFront]
      ↓
[AWS WAF — Web ACL]
      ↓
[Amazon Cognito — Sign-in / JWT Token]
      ↓
[Amazon API Gateway — REST API, JWT Authorizer]
      ↓
[Application Load Balancer — Public Subnet]
      ↓
[Amazon EC2 — Spring Boot Application — Private Subnet]
      ↓ (AWS SDK invoke)
[AWS Step Functions Workflow]
      ↓
[AWS Lambda: Context Builder | Source File Service | AI Invoke Service]
      ↓
[Amazon S3 — Source Code]  [AWS Secrets Manager — Credentials]
      ↓
[Amazon Bedrock — Claude 3 Haiku (us-east-1)]
      ↓
[Amazon RDS PostgreSQL — Metadata / Results / History]
```

#### 2.2. Quản lý người dùng (Amazon Cognito)

- Đăng ký / đăng nhập qua Amazon Cognito User Pool.
- JWT token do Cognito cấp; API Gateway xác thực qua Cognito Authorizer.
- Quên mật khẩu / xác nhận email: luồng Cognito Forgot Password.
- Phân quyền: Cognito Group USER và ADMIN (ADMIN xem toàn bộ project).
- Mật khẩu không lưu plaintext trong application database.

#### 2.3. Quản lý dự án

- **Import Git:** clone repository public (JGit shallow clone), loại bỏ `.git`, validate có file source; Step Functions Project Import xử lý và upload S3.
- **Upload Zip:** giải nén, nhận thư mục gốc; Step Functions Project Import upload S3.
- Metadata (tên, loại ngôn ngữ, sourceType, userId) lưu Amazon RDS PostgreSQL.
- `projectLanguage`: JAVA | PYTHON | DOTNET (chọn khi tạo hoặc auto-detect từ `pom.xml` / `requirements.txt` / `*.csproj` nếu có).
- Xóa dự án: xóa metadata RDS và object trên S3.

#### 2.4. Không gian làm việc IDE (Workspace)

- **Explorer:** cây thư mục; lọc thư mục nhiễu (`.git`, `node_modules`, `target`, `build`, `dist`, `__pycache__`, `bin`, `obj`, …).
- **Editor:** Monaco Editor (read-only), syntax highlight theo ngôn ngữ file.
- **AI Test Agent:** textarea yêu cầu + nút Generate Test.
- **Kết quả:** hiển thị mã test theo framework (JUnit / pytest / xUnit); copy.

#### 2.5. Sinh test bằng AI (Step Functions + Lambda + Bedrock)

1. Người dùng nhập yêu cầu (ví dụ: *"Viết test cho OrderService — thanh toán thành công và số dư không đủ"*).
2. Spring Boot trên EC2 gọi AWS Step Functions workflow qua AWS SDK.
3. Lambda **Context Builder** (Java | Python | .NET) đọc source từ S3 và credential từ AWS Secrets Manager; lọc file theo `projectLanguage`:
   - **JAVA:** file `*.java` (loại trừ thư mục test)
   - **PYTHON:** file `*.py` (loại trừ `tests/`, `__pycache__`)
   - **DOTNET:** file `*.cs` (loại trừ `*Tests*`, `*Test*`, `obj/`, `bin/`)
4. Lambda **Source File Service** đọc cây thư mục / nội dung file từ S3.
5. **Relevance scoring:** xếp hạng file theo từ khóa trong yêu cầu; bonus path chứa service, controller, handler, …
6. Gom context (giới hạn ~120.000 ký tự) từ S3.
7. Lambda **AI Invoke Service** gọi Amazon Bedrock (Claude 3 Haiku, us-east-1) với prompt template theo ngôn ngữ (JUnit 5 / pytest / xUnit).
8. Step Functions — **Result Service** (Save & Return): lưu kết quả vào RDS.
9. Step Functions — **History Service** (Persist): ghi `generation_records` trên RDS; trả kết quả cho client.

> Chế độ dev local: `AWS_ENABLED=false` trả template mock theo ngôn ngữ (không gọi Bedrock) — chỉ dùng khi phát triển trên máy dev, không phải production.

#### 2.6. Giám sát và vận hành

- Trang chủ / IDE: panel trạng thái RDS, S3, Bedrock (`/api/aws/status`).
- Amazon CloudWatch: log tập trung từ EC2, Lambda, API Gateway.
- CloudWatch Alarms: ngưỡng lỗi Bedrock, RDS connection, EC2 health → SNS.
- Amazon SNS: gửi email / notification khi alarm kích hoạt.
- AWS Budgets: cảnh báo chi phí vượt ngưỡng (Bedrock, EC2, RDS, …).
- Frontend: banner trạng thái kết nối backend (offline demo / cloud).

#### 2.7. Desktop client

- Electron thin client: load URL production qua Route 53 → CloudFront (HTTPS).
- Người dùng cuối: cài `ZeroBugAgent-Setup.exe`, bật WiFi, đăng nhập Cognito.
- Không cần cài Java, Docker hay AWS CLI trên máy client.

---

### 3. Cơ sở hạ tầng

#### 3.1. Sơ đồ kiến trúc

![ZeroBug Agent Architecture](/images/2-Proposal/architecture.png)

#### 3.2. Dịch vụ AWS (production)

| Dịch vụ | Region | Vai trò |
| --- | --- | --- |
| Amazon Route 53 | Global | DNS trỏ domain tới CloudFront |
| Amazon CloudFront | Global | CDN; phân phối nội dung tĩnh / edge |
| AWS WAF | Global | Web ACL gắn CloudFront; chặn request độc hại, rate limit |
| Amazon API Gateway | ap-southeast-1 | REST API public; JWT Authorizer |
| Amazon Cognito | ap-southeast-1 | User Pool; Sign-in / JWT Token |
| Application Load Balancer | ap-southeast-1 | ALB Public Subnet; forward tới EC2 Private Subnet |
| Amazon EC2 | ap-southeast-1 | Spring Boot JAR trong VPC Private Subnet; invoke Step Functions |
| AWS Step Functions | ap-southeast-1 | Orchestration: Import, Result, History |
| AWS Lambda | ap-southeast-1 | Context Builder, Source File Service, AI Invoke |
| Amazon S3 | ap-southeast-1 | Lưu source code project |
| Amazon RDS (PostgreSQL) | ap-southeast-1 | Metadata, results, history (JPA) |
| Amazon Bedrock Runtime | us-east-1 | Claude 3 Haiku — sinh Unit Test |
| AWS Secrets Manager | ap-southeast-1 | RDS credentials; Lambda đọc secret |
| Amazon CloudWatch | ap-southeast-1 | Log EC2, Lambda, Step Fn, API GW |
| Amazon SNS | ap-southeast-1 | Nhận CloudWatch Alarm |
| AWS Budgets | Global | Cảnh báo chi phí vượt ngưỡng |
| AWS IAM | — | Role EC2, Lambda, Step Functions |

URL production: `https://<domain>.com` (Route 53) → CloudFront → WAF → API GW (EC2 nằm Private Subnet; không expose trực tiếp ra internet).

#### 3.3. Thành phần ứng dụng

| Lớp | Công nghệ | Mô tả |
| --- | --- | --- |
| Frontend | Vite, JavaScript SPA | Giao diện web; Cognito SDK / JWT |
| Backend EC2 | Spring Boot 3, Java 17 | REST API; invoke Step Functions SDK |
| Orchestration | AWS Step Functions | Workflow Import → Result → History |
| Backend λ | AWS Lambda (Java/Py) | Context Builder, Source File, AI Invoke |
| Desktop | Electron 28 | Thin client, NSIS installer `.exe` |
| Import Git | Eclipse JGit | Clone repo public → upload S3 |
| Load balancer | ALB | Public Subnet; forward tới EC2 Private |

#### 3.4. Môi trường

| Profile | Database | Storage | Auth | AI |
| --- | --- | --- | --- | --- |
| cloud | RDS PostgreSQL | S3 | Cognito JWT | Bedrock Haiku |
| desktop/dev | H2 local | Local disk | Mock / Cognito | Mock response |

#### 3.5. Triển khai và vận hành

- Build: `build-all.bat` → Vite build FE vào `backend/static` + Maven package JAR + deploy Lambda artifacts + Step Functions state machine.
- VPC: Public Subnet (ALB) + Private Subnet (EC2, RDS).
- EC2: JAR + systemd trong Private Subnet; IAM Role invoke Step Functions.
- ALB: target group trỏ EC2; nhận traffic từ API Gateway.
- Lambda: deploy 3 functions; IAM Role `bedrock:InvokeModel` + S3 + Secrets Manager.
- Step Functions: state machine orchestrate Import, Result, History.
- API Gateway: stage production; JWT Authorizer (Cognito).
- CloudFront + WAF: phân phối edge; Web ACL bảo vệ.
- Route 53: alias tới CloudFront distribution.
- RDS: Security Group chỉ cho phép EC2 và Lambda (trong VPC Private Subnet).
- CloudWatch: log groups cho EC2, Lambda, Step Functions; alarm → SNS.
- Budgets: monthly budget alert qua email SNS.

---

### 4. Ngôn ngữ, công cụ và mô hình sử dụng

#### 4.1. Ngôn ngữ lập trình và framework

| Thành phần | Công nghệ |
| --- | --- |
| Backend EC2 | Java 17, Spring Boot 3.2, Spring Data JPA |
| Backend Lambda | Java 17 (hoặc Python 3.12 cho function nhẹ) |
| Frontend | JavaScript (ES modules), Vite 5 |
| Desktop | Electron, electron-builder |
| Database | PostgreSQL (RDS), H2 (dev) |
| Build | Maven, npm, AWS SAM / CLI (Lambda deploy) |
| Import Git | Eclipse JGit |
| Auth | Amazon Cognito User Pool |
| API edge | Amazon API Gateway, AWS WAF |

#### 4.2. Mô hình ngôn ngữ lớn (LLM)

| Model | Mục đích | Ghi chú |
| --- | --- | --- |
| Claude 3 Haiku (`anthropic.claude-3-haiku-20240307-v1:0`) | Phân tích source + sinh Unit Test cho Java / Python / .NET | Model duy nhất; tối ưu chi phí. Region: us-east-1 |

#### 4.3. Kỹ thuật xử lý ngữ cảnh (Context Builder — Lambda)

| Ngôn ngữ | File lọc | Framework output |
| --- | --- | --- |
| JAVA | `*.java`; exclude `*/test/*` | JUnit 5 + Mockito |
| PYTHON | `*.py`; exclude `tests/`, `__pycache__` | pytest |
| DOTNET | `*.cs`; exclude `*Test*`, `obj/`, `bin/` | xUnit (+ Moq nếu cần) |

Các bước chung: lọc thư mục nhiễu → relevance scoring → giới hạn context ~120.000 ký tự → giới hạn hiển thị file IDE >512KB không load full.

Không dùng Amazon Bedrock Knowledge Bases / RAG trong phiên bản này; ngữ cảnh thu thập trực tiếp từ S3 qua heuristic.

#### 4.4. Bảo mật

| Hạng mục | Giải pháp |
| --- | --- |
| Xác thực user | Amazon Cognito + JWT; API Gateway Authorizer |
| Mật khẩu DB / secret | AWS Secrets Manager; EC2/Lambda đọc lúc runtime |
| AWS credentials | IAM Role (EC2, Lambda); không hardcode access key |
| Network | WAF trên CloudFront; VPC Private Subnet; RDS trong VPC |
| HTTPS | Route 53 + CloudFront + ACM cert |
| Phân quyền | Cognito Groups USER / ADMIN; kiểm tra owner project |

#### 4.5. API chính

| Method | Endpoint | Chức năng |
| --- | --- | --- |
| GET | `/api/health` | Kiểm tra kết nối (public) |
| — | Cognito Hosted UI / SDK | Đăng ký / đăng nhập |
| GET | `/api/auth/me` | User từ JWT claims |
| GET | `/api/projects` | Danh sách dự án |
| POST | `/api/projects/import/git` | Import Git → Step Fn → S3 |
| POST | `/api/projects/import/zip` | Upload Zip → Step Fn → S3 |
| GET | `/api/projects/{id}/files` | Cây thư mục (S3 via Lambda) |
| GET | `/api/projects/{id}/file` | Nội dung file (Source File Svc) |
| POST | `/api/projects/{id}/generate` | Generate → Step Fn → Bedrock |
| GET | `/api/generations/recent` | Lịch sử sinh test |
| GET | `/api/aws/status` | Trạng thái RDS / S3 / Bedrock |
| DELETE | `/api/projects/{id}` | Xóa dự án |

---

### 5. Hướng đi và giải pháp vượt qua thách thức

#### 5.1. Bảng thách thức — giải pháp

| Thách thức | Giải pháp triển khai |
| --- | --- |
| Chi phí token cao | Lọc file theo ngôn ngữ; giới hạn 120KB context; dùng Claude Haiku; AWS Budgets alert |
| Chọn sai file / thiếu ngữ cảnh | Relevance scoring; user duyệt IDE trước khi generate; Language Router theo project |
| Đa ngôn ngữ (Java/Python/.NET) | `projectLanguage` + prompt template riêng; Context Builder filter extension khác nhau |
| Bảo mật API public | WAF + Cognito JWT + API Gateway Authorizer; Secrets Manager; IAM least privilege |
| Credential lộ trên server | Bỏ `cloud.env` plaintext; Secrets Manager rotation |
| Import Git tốn disk EC2 | Step Functions Project Import xử lý tạm; upload S3; dọn temp sau import |
| Timeout sinh test AI | Step Functions + Lambda AI Invoke (timeout 5–15 phút); async workflow nếu cần |
| Giám sát lỗi production | CloudWatch Logs + Alarms → SNS email |
| Chi phí AWS vượt ngân sách | AWS Budgets + SNS; dùng Haiku, không Sonnet |
| Người dùng cuối cài đặt | Electron thin client; không cần Java local |
| Tách FE / BE khi dev | Vite SPA + REST; FE dev `:5173` proxy `/api` |

#### 5.2. Hướng đi tổng thể

1. Production-ready trên AWS: mọi dịch vụ trên sơ đồ kiến trúc đều được cấu hình và sử dụng khi hệ thống vận hành.
2. EC2 (Spring Boot) điều phối API; AWS Step Functions orchestrate pipeline; Lambda xử lý logic nặng — tách trách nhiệm rõ ràng.
3. Edge layer (Route 53, CloudFront, WAF, Cognito, API Gateway, ALB) bảo vệ và chuẩn hóa truy cập trước khi vào VPC Private Subnet.
4. Đa ngôn ngữ Java / Python / .NET trong cùng một nền tảng, mở rộng bằng thêm bộ lọc file + prompt template.
5. Dev local: profile desktop + mock AI; production cloud bắt buộc full AWS stack.

#### 5.3. Kết quả mong đợi

- Nền tảng web + desktop sinh Unit Test cho Java, Python và .NET.
- Triển khai AWS end-to-end: Route 53, CloudFront, WAF, API Gateway, ALB, Cognito, EC2 (VPC), Step Functions, Lambda, S3, RDS, Bedrock, Secrets Manager, CloudWatch, SNS, Budgets.
- Tích hợp Amazon Bedrock vào quy trình QA với kiểm soát chi phí và bảo mật.
- Tài liệu và sơ đồ kiến trúc khớp với hệ thống thực tế triển khai.
