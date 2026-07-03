---
title: "Lambda — AI Invoke (Bedrock Mantle)"
date: 2024-01-01
weight: 3
chapter: false
pre: " <b> 5.6.3. </b> "
---

#### Mục tiêu

Lambda **`BedrockInvokeLambda`** gọi **Bedrock Mantle** (OpenAI-compatible **Chat Completions**) để sinh Unit Test; parse JSON response và trả về Step Functions.

#### Kiến trúc

| Thành phần | Giá trị |
| --- | --- |
| Lambda region | `ap-southeast-1` (VPC private + `zerobug-lambda-sg`) |
| Mantle endpoint | `https://bedrock-mantle.us-east-1.api.aws` |
| Chat path | `/v1/chat/completions` |
| Model ID | `openai.gpt-oss-120b` |
| Auth | `Authorization: Bearer <token>` — env **`BEDROCK_MANTLE_API_KEY`** |
| Egress | **NAT Gateway** `zerobug-nat` (cross-region HTTPS → `us-east-1`) |

#### Bước 1 — Tạo Bedrock API key

1. Console → **Amazon Bedrock** → region **`us-east-1`**.
2. **API keys** → **Create API key** → TTL workshop (~30 ngày).
3. Copy token **một lần** — dùng cho bước 3.

<!-- Hình: /images/5-Workshop/5.6/bedrock-api-key.png -->

#### Bước 2 — Tạo Lambda function

1. **Lambda** → **Create function**.
2. **Function name:** `BedrockInvokeLambda`.
3. Runtime: **Java 17** *(hoặc Python 3.12 — khớp artifact `build-all.bat`)*.
4. **Execution role:** `zerobug-lambda-role`.
5. **VPC:** `zerobug-vpc`, private subnet A/B, SG **`zerobug-lambda-sg`**.

#### Bước 3 — Environment variables

| Key | Value |
| --- | --- |
| `BEDROCK_MANTLE_API_KEY` | Token từ Bước 1 |
| `BEDROCK_MANTLE_BASE_URL` | `https://bedrock-mantle.us-east-1.api.aws` |
| `BEDROCK_MANTLE_MODEL_ID` | `openai.gpt-oss-120b` |

{{% notice warning %}}
Key **không** lưu Secrets Manager trong workshop này — rotate trước khi hết hạn 30 ngày.
{{% /notice %}}

#### Bước 4 — Deploy code & timeout

1. Upload JAR/ZIP từ `build-all.bat`.
2. **Timeout:** ≥ **60 s** (cross-region + sinh test).
3. **Memory:** 512 MB–1024 MB.

#### Bước 5 — Gọi API (logic tham chiếu)

Request mẫu (Java `HttpClient`):

```java
HttpClient client = HttpClient.newBuilder()
    .connectTimeout(Duration.ofSeconds(20)).build();
HttpRequest request = HttpRequest.newBuilder()
    .uri(URI.create("https://bedrock-mantle.us-east-1.api.aws/v1/chat/completions"))
    .header("Content-Type", "application/json")
    .header("Authorization", "Bearer " + API_KEY)
    .POST(HttpRequest.BodyPublishers.ofString(payload.toString()))
    .build();
HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
```

Body JSON (OpenAI-compatible): field **`model`** = `openai.gpt-oss-120b`, **`messages`** chứa prompt Unit Test.

#### Bước 6 — Test invoke

1. Lambda → **Test** với payload Step Functions mẫu.
2. **Kỳ vọng:** HTTP **200 OK**, JSON OpenAI có nội dung test đã lọc (regex) trong log.

| Lỗi | Xử lý |
| --- | --- |
| Timeout | Tăng Lambda timeout; kiểm NAT/route private |
| 401/403 | Key hết hạn hoặc sai env `BEDROCK_MANTLE_API_KEY` |
| Connection refused / hang | NAT chưa Available; outbound `zerobug-lambda-sg` All traffic |
| Model access denied | Kiệt bật model ở **us-east-1** (mục 5.4.5) |

#### Embeddings (tùy chọn RAG)

Path **`/v1/embeddings`**, model **`cohere.embed-multilingual-v3`** — cùng base URL và Bearer token.

<!-- Hình: /images/5-Workshop/5.6/lambda-bedrock-mantle-env.png -->
<!-- Hình: /images/5-Workshop/5.6/lambda-test-200.png — CloudWatch log HTTP 200 -->
