---
title : "Deploy to Stage"
date : 2024-01-01 
weight : 5
chapter : false
pre : " <b> 5.4.5 </b> "
---

#### Deploy the API to a Stage (prod)

After fully configuring Resources, Methods, the Cognito Authorizer, and CORS, the final step is to **Deploy** the API to create a public, callable URL.

**Step 1 – Deploy the API**

1. In the `zerobug-agent-api` API, click **Deploy API** (top-right corner).
2. **Stage**: choose **New stage**.
3. **Stage name**: enter `prod`.
4. **Description**: `Production stage` (optional).
5. Click **Deploy**.

![Deploy API](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.5/1.png)
![Deploy API](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.5/2.png)

**Step 2 – Get the Invoke URL**

After deployment, go to the left menu **Stages** → select `prod`. At the top is the **Invoke URL**, in the form:

```
https://<API_ID>.execute-api.ap-southeast-1.amazonaws.com/prod
```

This workshop's example:

```
https://sb9qx62pe9.execute-api.ap-southeast-1.amazonaws.com/prod
```

![Invoke URL](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.5/3.png)

**Step 3 – Record each resource endpoint**

Test endpoint = Invoke URL + resource path:

| Endpoint | Full URL |
| --- | --- |
| Projects | `<Invoke URL>/projects` |
| Auth | `<Invoke URL>/auth` |
| AWS status | `<Invoke URL>/aws` |

Configure the base URL for the Vite SPA:

```env
VITE_API_GATEWAY_URL=https://sb9qx62pe9.execute-api.ap-southeast-1.amazonaws.com/prod
```

{{% notice note %}}
**Common pitfall:** every time you change a Resource / Method / Authorizer / CORS, you must **Deploy the API again** for the change to take effect on the `prod` stage. If a test seems "not updated", redeploy.
{{% /notice %}}
