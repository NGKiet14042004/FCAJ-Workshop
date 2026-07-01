---
title : "Configure CORS for the Vite SPA"
date : 2024-01-01 
weight : 4
chapter : false
pre : " <b> 5.4.4 </b> "
---

#### Configure CORS (Cross-Origin Resource Sharing) for the Vite SPA

The Vite SPA runs at `http://localhost:5173` — a different domain from API Gateway, so the browser blocks requests if CORS is not configured. CORS allows the front-end to call the API from the browser.

**Step 1 – Enable CORS for /projects**

1. In the Resources view of `zerobug-agent-api`, select the **`/projects`** resource.
2. Click **Enable CORS**.
3. Fill in the configuration:

| Setting | Value |
| --- | --- |
| **Access-Control-Allow-Origin** | `http://localhost:5173` (or `*` for a quick demo only) |
| **Access-Control-Allow-Headers** | `Content-Type, Authorization` |
| **Access-Control-Allow-Methods** | `GET, OPTIONS` (add `POST, DELETE` later if needed) |

4. Click **Save**.

![Enable CORS](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.4-dns-simulation/enable-cors.png)

{{% notice warning %}}
The **`Authorization`** header must be included in **Access-Control-Allow-Headers**, otherwise the front-end cannot send the token through the browser and will fail with a CORS error.
{{% /notice %}}

**Step 2 – Repeat for /auth and /aws**

1. Select `/auth` → **Enable CORS** → configure as above → **Save**.
2. Select `/aws` → **Enable CORS** → configure as above → **Save**.

![CORS on every resource](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.4-dns-simulation/cors-all.png)

**Step 3 – Verify the auto-created OPTIONS method**

When you enable CORS, API Gateway automatically creates an **OPTIONS** method for each resource (the browser's preflight request). Confirm that `OPTIONS` appears next to `GET` in the resource tree — this is expected.

{{% notice note %}}
After enabling CORS for all resources, proceed to **Deploy the API** in step 5.4.5 so the changes take effect.
{{% /notice %}}

![OPTIONS method](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.4-dns-simulation/options.png)
