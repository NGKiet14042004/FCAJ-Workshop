---
title : "Define Resources and Methods"
date : 2024-01-01 
weight : 2
chapter : false
pre : " <b> 5.4.2 </b> "
---

#### Define Resources and Methods (/auth, /projects, /aws)

ZeroBug Agent has 3 main resource groups, each corresponding to a business module in the Spring Boot backend:

```
/ (root)
├── /auth        → Sign in / sign up / refresh token
├── /projects    → Project management
└── /aws         → AWS system status
```

{{% notice note %}}
In this workshop, each resource is created with a single **GET** method using a **Mock integration** to **test authentication** (whether API Gateway blocks requests without a token). When integrating the real backend, you would change the integration to **HTTP / VPC Link** pointing to the ALB → EC2.
{{% /notice %}}

**Step 1 – Create the /auth resource**

1. In the Resources view, select the root `/`.
2. Click **Create resource**.
3. **Resource name**: `auth` (keep Resource path as `/`).
4. Click **Create resource**.

![Create /auth resource](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.2/1.png)
![Create /auth resource](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.2/2.png)

**Step 2 – Create the /projects and /aws resources**

1. Select the root `/` again → **Create resource** → enter `projects` → **Create resource**.
2. Select the root `/` again → **Create resource** → enter `aws` → **Create resource**.

![Full resource tree](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.2/3.png)

**Step 3 – Create a GET method for /projects**

1. Click the **`/projects`** resource.
2. Click **Create method**.
3. **Method type**: choose **GET**.
4. **Integration type**: choose **Mock**.
5. Click **Create method**.

![Create GET method](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.2/4.png)
![Create GET method](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.2/5.png)

**Step 4 – Create GET methods for /auth and /aws**

1. Select `/auth` → **Create method** → **GET** → **Mock** → **Create method**.
2. Select `/aws` → **Create method** → **GET** → **Mock** → **Create method**.

After this step, each of `/auth`, `/projects`, and `/aws` has a **GET** method.

![GET method on every resource](/images/5-Workshop/5.4-Configuring-amazon-api-gateway/5.4.2/6.png)

{{% notice tip %}}
A **Mock integration** returns a simulated response, enough to verify the authentication layer without a backend. The workshop's goal is to prove that the **Cognito Authorizer** blocks/allows requests correctly.
{{% /notice %}}
