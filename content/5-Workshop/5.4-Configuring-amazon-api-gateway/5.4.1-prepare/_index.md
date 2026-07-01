---
title : "Create REST API"
date : 2024-01-01 
weight : 1
chapter : false
pre : " <b> 5.4.1 </b> "
---

#### Create a REST API on Amazon API Gateway

**Step 1 – Open the API Gateway Console**

1. Sign in to the [AWS Management Console](https://console.aws.amazon.com/), making sure the Region is **ap-southeast-1**.
2. Search for **API Gateway** → open the service.

![Open API Gateway](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.1/1.png)

**Step 2 – Choose the API type**

1. Find the **REST API** card (not **REST API Private**, and not **HTTP API** or **WebSocket API**).
2. Click **Build** in the REST API card.

{{% notice note %}}
ZeroBug Agent uses a **REST API** because it needs a **Cognito Authorizer**, **Usage Plans / API Keys**, and more advanced options than the HTTP API offers.
{{% /notice %}}

![Choose REST API](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.1e/2.png)

**Step 3 – Configure the API**

1. Choose **New API**.
2. **API name**: `zerobug-agent-api`.
3. **Description**: `API Gateway for ZeroBug Agent` (optional).
4. **API endpoint type**: choose **Regional** (since it lives in region ap-southeast-1; in production CloudFront already handles the CDN).
5. Click **Create API**.

![Create REST API](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.1/3.png)

**Step 4 – Review the new API structure**

After creation, you see the **Resources** view with the root `/`. This is the starting point for adding the `/auth`, `/projects`, and `/aws` resources in step 5.4.2.

![REST API created](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.1/4.png)
