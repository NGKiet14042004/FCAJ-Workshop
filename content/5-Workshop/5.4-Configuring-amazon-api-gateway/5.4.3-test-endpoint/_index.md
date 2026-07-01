---
title : "Configure JWT Authorizer"
date : 2024-01-01 
weight : 3
chapter : false
pre : " <b> 5.4.3 </b> "
---

#### Configure a Cognito Authorizer Integrated with the User Pool

A Cognito Authorizer lets API Gateway automatically authenticate every request by validating the JWT Token in the `Authorization` header against the Cognito User Pool — without writing authentication code in the backend.

**Step 1 – Create the Authorizer**

1. In the `zerobug-agent-api` API → left menu **Authorizers**.
2. Click **Create authorizer**.

![Open Authorizers](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.3/1.png)

**Step 2 – Configure the Cognito Authorizer**

1. **Authorizer name**: `zerobug-cognito-authorizer`.
2. **Authorizer type**: choose **Cognito**.
3. **Cognito user pool**:
   - **Region**: `ap-southeast-1`.
   - Select the pool `zerobug-agent-user-pool` (ID `ap-southeast-1_GevSgtD8j`).
4. **Token source**: enter `Authorization` (the name of the header carrying the token).
5. **Token validation**: leave empty.
6. Click **Create authorizer**.

![Create Cognito Authorizer](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.3/2.png)

{{% notice note %}}
**Token source = `Authorization`** means the client must attach the header `Authorization: <IdToken>`. With a REST API + Cognito Authorizer, the value is the **raw token string** (no `Bearer ` prefix).
{{% /notice %}}

**Step 3 – Attach the Authorizer to Methods**

1. Left menu **Resources** → select the **GET** method of `/projects`.
2. Open the **Method request** tab → click **Edit**.
3. **Authorization**: choose `zerobug-cognito-authorizer`.
4. Click **Save**.
5. Repeat for the **GET** method of `/auth` and `/aws`.

![Attach the Authorizer to a Method](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.3/4.png)
![Attach the Authorizer to a Method](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.3/5.png)

**Step 4 – Quick Authorizer test (optional)**

1. Go back to **Authorizers** → select `zerobug-cognito-authorizer` → **Test**.
2. Paste a valid IdToken into the **Authorization** field (obtained in step 5.5).
3. Valid token → returns **200** with claims; missing/invalid token → **401**.

{{% notice tip %}}
Every time you change an Authorizer or Method, remember to **Deploy the API again** (step 5.4.5) so the changes take effect on the `prod` stage.
{{% /notice %}}

![Test Authorizer](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.3/3.png)
