---
title : "Configure App Client"
date : 2024-01-01 
weight : 2
chapter : false
pre : " <b> 5.3.2 </b> "
---

#### Configure the App Client (Public client / SPA — No Client Secret Required)

The App Client represents the front-end application when interacting with the Cognito User Pool. In step 5.3.1, the App Client `zerobug-agent-spa` was created automatically as a **Single-page application (Public client)**. This step verifies and finalizes its configuration.

**Step 1 – Open the App Client**

1. In the `zerobug-agent-user-pool` User Pool → left menu **App clients**.
2. Click on `zerobug-agent-spa`.

![Open App Client](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.2/1.png)

**Step 2 – Confirm there is no Client Secret**

Because it is a Public client (SPA), the App Client has **no** Client Secret — exactly as required for a Vite SPA (the source code runs in the browser and cannot keep a secret secure). Verify the **Client secret** field shows *Not generated*.

![No Client Secret](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.2/2.png)

**Step 3 – Configure Login pages (Hosted UI / OAuth)**

1. In the App Client → **Login pages** section → click **Edit**.
2. Verify / fill in:
   - **Allowed callback URLs**: `http://localhost:5173/callback`
   - **Allowed sign-out URLs**: `http://localhost:5173`
   - **Identity providers**: **Cognito user pool**
   - **OAuth 2.0 grant types**: check **Authorization code grant**
   - **OpenID Connect scopes**: check **openid**, **email**, **profile**
3. Click **Save changes**.

![OAuth configuration](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.2/3.png)
![OAuth configuration](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.2/4.png)
![OAuth configuration](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.2/5.png)

**Step 4 – Enable an Authentication flow for testing**

To be able to obtain tokens via the AWS CLI/Postman in step 5.5, enable the username/password sign-in flow:

1. In the App Client → **Authentication flows** section → **Edit**.
2. Additionally check **ALLOW_USER_PASSWORD_AUTH**.
3. Keep **ALLOW_REFRESH_TOKEN_AUTH** (used for the Refresh Token in 5.5.3).
4. Click **Save changes**.

{{% notice warning %}}
Do **NOT** enable `ALLOW_ADMIN_USER_PASSWORD_AUTH` for a public client — that flow is for server-side use and requires a Client Secret.
{{% /notice %}}

![Authentication flows](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.2/6.png)
![Authentication flows](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.2/7.png)

**Step 5 – Record the App Client ID**

The App Client ID is used to configure the Vite SPA and to obtain tokens via the CLI:

```env
VITE_COGNITO_USER_POOL_ID=ap-southeast-1_GevSgtD8j
VITE_COGNITO_CLIENT_ID=4kmjdov040cmrulog2fmmcgnr7
VITE_COGNITO_REGION=ap-southeast-1
```

![App Client ID](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.2/8.png)
