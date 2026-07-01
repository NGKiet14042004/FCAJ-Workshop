---
title : "Create User Pool"
date : 2024-01-01 
weight : 1
chapter : false
pre : " <b> 5.3.1 </b> "
---

#### Create an Amazon Cognito User Pool

The User Pool stores user accounts and defines the sign-in/sign-up rules for ZeroBug Agent. The new Cognito console uses the **"Define your application"** quick-create flow — it combines creating the User Pool and the App Client on a single page.

{{% notice note %}}
From this step onward, work as the IAM User `zerobug-admin` created in 5.2, and make sure the Region is **ap-southeast-1 (Singapore)**.
{{% /notice %}}

**Step 1 – Open the Amazon Cognito Console**

1. Sign in to the [AWS Management Console](https://console.aws.amazon.com/).
2. Search for **Cognito** → open the service.
3. Left menu → **User pools** → click **Create user pool**.

![Open Cognito Console](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.1/1.png)
![Create User Pool](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.1/2.png)

**Step 2 – Define your application**

1. **Application type**: choose **Single-page application (SPA)**.
   - Because the ZeroBug Agent front-end is a Vite SPA → this is exactly a **Public client** (no Client Secret).
2. **Name your application**: enter `zerobug-agent-spa`.
3. **Options for sign-in identifiers**: check **Email** (leave out Phone number and Username).
4. **Self-registration**: keep **Enable self-registration** checked.
5. **Required attributes for sign-up**: select **email** (add **name** if needed).

{{% notice warning %}}
Cognito warns: *"Options for sign-in identifiers and required attributes can't be changed after the app has been created."* → Choose **Email** and the required attributes correctly now, because after creation they **cannot be changed** (you would have to recreate the User Pool).
{{% /notice %}}

![Define your application](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.1/3.png)

**Step 3 – Add a return URL**

1. **Return URL**: enter `http://localhost:5173/callback` (the Vite dev environment).
2. Click **Create user directory**.

{{% notice tip %}}
If the Return URL field shows *"Return URL contains invalid characters"*, it is usually because the field was pre-filled with `https://` and you typed after it (resulting in `https://http://...`), or there is a trailing space. **Clear the field completely** and re-type `http://localhost:5173/callback`. Cognito allows `http://localhost` for testing.
{{% /notice %}}

![Add a return URL](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.1/4.png)

**Step 4 – Rename the User Pool (optional)**

Cognito creates the User Pool with a random name. Go to **Overview** → **Rename** to change it to `zerobug-agent-user-pool` for easier identification.

![Rename](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.1/5.png)

**Step 5 – Record important values**

Open the new User Pool and record the following values (used in 5.4 and 5.5):

| Information | Where to find it | Example (this workshop) |
| --- | --- | --- |
| **User Pool ID** | Overview → **User pool ID** | `ap-southeast-1_GevSgtD8j` |
| **App Client ID** | **App clients** → `zerobug-agent-spa` → Client ID | `4kmjdov040cmrulog2fmmcgnr7` |
| **Token signing key URL (JWKS)** | Overview → **Token signing key URL** | `https://cognito-idp.ap-southeast-1.amazonaws.com/ap-southeast-1_GevSgtD8j/.well-known/jwks.json` |

{{% notice note %}}
The **User Pool ID** is used when creating the Cognito Authorizer in API Gateway (step 5.4.3) and when obtaining/setting passwords via the AWS CLI (steps 5.3.3, 5.5).
{{% /notice %}}
