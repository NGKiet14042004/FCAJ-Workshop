---
title: "Proposal"
date: 2024-01-01
weight: 2
chapter: false
pre: " <b> 2. </b> "
---

# ZeroBug Agent
## AI-Powered Automated Unit Test Generation Platform on AWS

---

### 1. Project Overview

**ZeroBug Agent** is an AI system built on Amazon Web Services (AWS) that automatically generates Unit Tests from project source code. The system supports three core languages: **Java** (JUnit 5 + Mockito), **Python** (pytest), and **C# / .NET** (xUnit).

Rather than submitting a single isolated code file to an AI, users import an entire project (via public Git or Zip upload), browse the file tree in an integrated IDE interface, and describe test requirements in natural language. The backend collects relevant source files by language type, packages the context, and sends it to Amazon Bedrock (Claude 3 Haiku) to generate test code.

**Main objectives:**

- Reduce Unit Test writing time for developers and QA engineers.
- Improve test case suggestions with AI using multi-file context.
- Provide an IDE-like experience: view source, generate tests, copy results.
- Deploy to production on AWS with full security and monitoring.
- Offer a desktop client (Electron) — users only need WiFi and the app.

**Project scope:**

- Generate Unit Tests (does not automatically run test suites on CI yet).
- Languages: Java, Python, .NET (C#).
- Import projects via public Git or Zip upload.
- Architecture: Frontend (Vite SPA / Electron) + Backend (Spring Boot on EC2 in VPC) + AWS Step Functions (orchestration) + AWS Lambda + AWS services (Route 53, CloudFront, WAF, API Gateway, ALB, Cognito, S3, RDS, Bedrock, Secrets Manager, CloudWatch, SNS, Budgets, IAM).

**Target users:**

- Developers / students who need a quick test baseline.
- Admins managing the system and monitoring AWS service status.

---

### 2. Business Description

#### 2.1. Overall Business Flow

```
Sign up / Sign in (Amazon Cognito)
  → Create project (choose language: Java / Python / .NET; Import Git or Zip)
  → Open IDE (Explorer + Monaco Editor)
  → Enter test requirements
  → Generate Test (Step Functions → Lambda + Bedrock)
  → View / Copy results; history stored on RDS
```

**Infrastructure access flow:**

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

#### 2.2. User Management (Amazon Cognito)

- Sign up / sign in via Amazon Cognito User Pool.
- JWT tokens issued by Cognito; API Gateway validates via Cognito Authorizer.
- Forgot password / email confirmation: Cognito Forgot Password flow.
- Authorization: Cognito Groups USER and ADMIN (ADMIN can view all projects).
- Passwords are not stored in plaintext in the application database.

#### 2.3. Project Management

- **Git Import:** clone public repository (JGit shallow clone), remove `.git`, validate source files; Step Functions Project Import processes and uploads to S3.
- **Zip Upload:** extract archive, detect root folder; Step Functions Project Import uploads to S3.
- Metadata (name, language type, sourceType, userId) stored in Amazon RDS PostgreSQL.
- `projectLanguage`: JAVA | PYTHON | DOTNET (selected on creation or auto-detected from `pom.xml` / `requirements.txt` / `*.csproj` if present).
- Delete project: remove RDS metadata and S3 objects.

#### 2.4. IDE Workspace

- **Explorer:** file tree; filters noisy directories (`.git`, `node_modules`, `target`, `build`, `dist`, `__pycache__`, `bin`, `obj`, …).
- **Editor:** Monaco Editor (read-only), syntax highlighting by file language.
- **AI Test Agent:** requirement textarea + Generate Test button.
- **Results:** display test code by framework (JUnit / pytest / xUnit); copy to clipboard.

#### 2.5. AI Test Generation (Step Functions + Lambda + Bedrock)

1. User enters a requirement (e.g., *"Write tests for OrderService — successful payment and insufficient balance"*).
2. Spring Boot on EC2 invokes AWS Step Functions workflow via AWS SDK.
3. Lambda **Context Builder** (Java | Python | .NET) reads source from S3 and credentials from AWS Secrets Manager; filters files by `projectLanguage`:
   - **JAVA:** `*.java` files (exclude test directories)
   - **PYTHON:** `*.py` files (exclude `tests/`, `__pycache__`)
   - **DOTNET:** `*.cs` files (exclude `*Tests*`, `*Test*`, `obj/`, `bin/`)
4. Lambda **Source File Service** reads directory tree / file content from S3.
5. **Relevance scoring:** ranks files by keywords in the request; bonus for paths containing service, controller, handler, …
6. Assemble context (limit ~120,000 characters) from S3.
7. Lambda **AI Invoke Service** calls Amazon Bedrock (Claude 3 Haiku, us-east-1) with language-specific prompt templates (JUnit 5 / pytest / xUnit).
8. Step Functions — **Result Service** (Save & Return): save results to RDS.
9. Step Functions — **History Service** (Persist): write `generation_records` to RDS; return results to client.

> Local dev mode: `AWS_ENABLED=false` returns mock templates by language (no Bedrock call) — for development only, not production.

#### 2.6. Monitoring and Operations

- Home / IDE: RDS, S3, Bedrock status panel (`/api/aws/status`).
- Amazon CloudWatch: centralized logs from EC2, Lambda, API Gateway.
- CloudWatch Alarms: Bedrock errors, RDS connection, EC2 health → SNS.
- Amazon SNS: email / notification when alarms trigger.
- AWS Budgets: cost threshold alerts (Bedrock, EC2, RDS, …).
- Frontend: backend connection status banner (offline demo / cloud).

#### 2.7. Desktop Client

- Electron thin client: loads production URL via Route 53 → CloudFront (HTTPS).
- End users: install `ZeroBugAgent-Setup.exe`, connect WiFi, sign in via Cognito.
- No Java, Docker, or AWS CLI required on the client machine.

---

### 3. Infrastructure

#### 3.1. Architecture Diagram

![ZeroBug Agent Architecture](/images/2-Proposal/architecture.jfif)

#### 3.2. AWS Services (Production)

| Service | Region | Role |
| --- | --- | --- |
| Amazon Route 53 | Global | DNS pointing domain to CloudFront |
| Amazon CloudFront | Global | CDN; static content / edge distribution |
| AWS WAF | Global | Web ACL on CloudFront; block malicious requests, rate limit |
| Amazon API Gateway | ap-southeast-1 | Public REST API; JWT Authorizer |
| Amazon Cognito | ap-southeast-1 | User Pool; Sign-in / JWT Token |
| Application Load Balancer | ap-southeast-1 | ALB Public Subnet; forwards to EC2 Private Subnet |
| Amazon EC2 | ap-southeast-1 | Spring Boot JAR in VPC Private Subnet; invokes Step Functions |
| AWS Step Functions | ap-southeast-1 | Orchestration: Import, Result, History |
| AWS Lambda | ap-southeast-1 | Context Builder, Source File Service, AI Invoke |
| Amazon S3 | ap-southeast-1 | Store project source code |
| Amazon RDS (PostgreSQL) | ap-southeast-1 | Metadata, results, history (JPA) |
| Amazon Bedrock Runtime | us-east-1 | Claude 3 Haiku — generate Unit Tests |
| AWS Secrets Manager | ap-southeast-1 | RDS credentials; Lambda reads secrets |
| Amazon CloudWatch | ap-southeast-1 | Logs for EC2, Lambda, Step Fn, API GW |
| Amazon SNS | ap-southeast-1 | Receives CloudWatch Alarms |
| AWS Budgets | Global | Cost threshold alerts |
| AWS IAM | — | Roles for EC2, Lambda, Step Functions |

Production URL: `https://<domain>.com` (Route 53) → CloudFront → WAF → API GW (EC2 in Private Subnet; not directly exposed to the internet).

#### 3.3. Application Components

| Layer | Technology | Description |
| --- | --- | --- |
| Frontend | Vite, JavaScript SPA | Web UI; Cognito SDK / JWT |
| Backend EC2 | Spring Boot 3, Java 17 | REST API; invoke Step Functions SDK |
| Orchestration | AWS Step Functions | Workflow Import → Result → History |
| Backend λ | AWS Lambda (Java/Py) | Context Builder, Source File, AI Invoke |
| Desktop | Electron 28 | Thin client, NSIS `.exe` installer |
| Git Import | Eclipse JGit | Clone public repo → upload S3 |
| Load balancer | ALB | Public Subnet; forwards to EC2 Private |

#### 3.4. Environments

| Profile | Database | Storage | Auth | AI |
| --- | --- | --- | --- | --- |
| cloud | RDS PostgreSQL | S3 | Cognito JWT | Bedrock Haiku |
| desktop/dev | H2 local | Local disk | Mock / Cognito | Mock response |

#### 3.5. Deployment and Operations

- Build: `build-all.bat` → Vite build FE into `backend/static` + Maven package JAR + deploy Lambda artifacts + Step Functions state machine.
- VPC: Public Subnet (ALB) + Private Subnet (EC2, RDS).
- EC2: JAR + systemd in Private Subnet; IAM Role to invoke Step Functions.
- ALB: target group pointing to EC2; receives traffic from API Gateway.
- Lambda: deploy 3 functions; IAM Role with `bedrock:InvokeModel` + S3 + Secrets Manager.
- Step Functions: state machine orchestrates Import, Result, History.
- API Gateway: production stage; JWT Authorizer (Cognito).
- CloudFront + WAF: edge distribution; Web ACL protection.
- Route 53: alias to CloudFront distribution.
- RDS: Security Group allows only EC2 and Lambda (in VPC Private Subnet).
- CloudWatch: log groups for EC2, Lambda, Step Functions; alarms → SNS.
- Budgets: monthly budget alert via SNS email.

---

### 4. Languages, Tools, and Models

#### 4.1. Programming Languages and Frameworks

| Component | Technology |
| --- | --- |
| Backend EC2 | Java 17, Spring Boot 3.2, Spring Data JPA |
| Backend Lambda | Java 17 (or Python 3.12 for lightweight functions) |
| Frontend | JavaScript (ES modules), Vite 5 |
| Desktop | Electron, electron-builder |
| Database | PostgreSQL (RDS), H2 (dev) |
| Build | Maven, npm, AWS SAM / CLI (Lambda deploy) |
| Git Import | Eclipse JGit |
| Auth | Amazon Cognito User Pool |
| API edge | Amazon API Gateway, AWS WAF |

#### 4.2. Large Language Model (LLM)

| Model | Purpose | Notes |
| --- | --- | --- |
| Claude 3 Haiku (`anthropic.claude-3-haiku-20240307-v1:0`) | Analyze source + generate Unit Tests for Java / Python / .NET | Single model; cost-optimized. Region: us-east-1 |

#### 4.3. Context Processing (Context Builder — Lambda)

| Language | File filter | Output framework |
| --- | --- | --- |
| JAVA | `*.java`; exclude `*/test/*` | JUnit 5 + Mockito |
| PYTHON | `*.py`; exclude `tests/`, `__pycache__` | pytest |
| DOTNET | `*.cs`; exclude `*Test*`, `obj/`, `bin/` | xUnit (+ Moq if needed) |

Common steps: filter noisy directories → relevance scoring → limit context to ~120,000 characters → IDE file display limit: files >512KB not fully loaded.

Amazon Bedrock Knowledge Bases / RAG is not used in this version; context is collected directly from S3 via heuristics.

#### 4.4. Security

| Area | Solution |
| --- | --- |
| User authentication | Amazon Cognito + JWT; API Gateway Authorizer |
| DB password / secrets | AWS Secrets Manager; EC2/Lambda read at runtime |
| AWS credentials | IAM Roles (EC2, Lambda); no hardcoded access keys |
| Network | WAF on CloudFront; VPC Private Subnet; RDS in VPC |
| HTTPS | Route 53 + CloudFront + ACM certificate |
| Authorization | Cognito Groups USER / ADMIN; project owner checks |

#### 4.5. Main API Endpoints

| Method | Endpoint | Function |
| --- | --- | --- |
| GET | `/api/health` | Health check (public) |
| — | Cognito Hosted UI / SDK | Sign up / sign in |
| GET | `/api/auth/me` | User from JWT claims |
| GET | `/api/projects` | List projects |
| POST | `/api/projects/import/git` | Import Git → Step Fn → S3 |
| POST | `/api/projects/import/zip` | Upload Zip → Step Fn → S3 |
| GET | `/api/projects/{id}/files` | Directory tree (S3 via Lambda) |
| GET | `/api/projects/{id}/file` | File content (Source File Svc) |
| POST | `/api/projects/{id}/generate` | Generate → Step Fn → Bedrock |
| GET | `/api/generations/recent` | Generation history |
| GET | `/api/aws/status` | RDS / S3 / Bedrock status |
| DELETE | `/api/projects/{id}` | Delete project |

---

### 5. Direction and Challenge Mitigation

#### 5.1. Challenges and Solutions

| Challenge | Mitigation |
| --- | --- |
| High token costs | Filter files by language; limit 120KB context; use Claude Haiku; AWS Budgets alert |
| Wrong files / missing context | Relevance scoring; user reviews IDE before generate; Language Router by project |
| Multi-language (Java/Python/.NET) | `projectLanguage` + separate prompt templates; Context Builder filter extensions |
| Public API security | WAF + Cognito JWT + API Gateway Authorizer; Secrets Manager; IAM least privilege |
| Credential exposure on server | Remove plaintext `cloud.env`; Secrets Manager rotation |
| Large Git import overloads EC2 disk | Step Functions Project Import handles temp processing; upload S3; cleanup after import |
| AI test generation timeout | Step Functions + Lambda AI Invoke (5–15 min timeout); async workflow if needed |
| Production errors not detected | CloudWatch Logs + Alarms → SNS email |
| AWS costs exceed budget | AWS Budgets + SNS; use Haiku, not Sonnet |
| Difficult end-user installation | Electron thin client; no local Java required |
| FE / BE separation during dev | Vite SPA + REST; FE dev `:5173` proxies `/api` |

#### 5.2. Overall Direction

1. Production-ready on AWS: every service in the architecture diagram is configured and used in production.
2. EC2 (Spring Boot) orchestrates APIs; AWS Step Functions orchestrates the pipeline; Lambda handles heavy logic — clear separation of concerns.
3. Edge layer (Route 53, CloudFront, WAF, Cognito, API Gateway, ALB) protects and standardizes access before entering the VPC Private Subnet.
4. Multi-language Java / Python / .NET on a single platform, extensible by adding file filters + prompt templates.
5. Local dev: desktop profile + mock AI; production cloud requires full AWS stack.

#### 5.3. Expected Outcomes

- Web + desktop platform generating Unit Tests for Java, Python, and .NET.
- End-to-end AWS deployment: Route 53, CloudFront, WAF, API Gateway, ALB, Cognito, EC2 (VPC), Step Functions, Lambda, S3, RDS, Bedrock, Secrets Manager, CloudWatch, SNS, Budgets.
- Amazon Bedrock integrated into the QA workflow with cost control and security.
- Documentation and architecture diagrams aligned with the actual deployed system.
