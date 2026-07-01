---
title : "Prerequisites"
date : 2024-01-01 
weight : 2 
chapter : false
pre : " <b> 5.2. </b> "
---

#### Objective

Before starting, you need: an AWS account, an **IAM User** with sufficient permissions for Cognito and API Gateway, an API testing tool (Postman), and the correct **Region** selected.

#### 1. Sign in to the Console and Select the Region

1. Sign in to the [AWS Management Console](https://console.aws.amazon.com/) with your **Root** account.
2. In the top-right corner, open the Region dropdown and select **Asia Pacific (Singapore) `ap-southeast-1`**.

{{% notice note %}}
The entire workshop is performed in region **ap-southeast-1**. Make sure the Region is correct at every step (Cognito, API Gateway, CLI).
{{% /notice %}}

![Select Region ap-southeast-1](/images/5-Workshop/5.2-Prerequisite/1.png)

#### 2. Create an IAM User for the Workshop

Instead of working with the Root account, create a dedicated IAM User (a security best practice).

**Step 1 – Open IAM and create a user**

1. Search bar → type **IAM** → open the **IAM** service.
2. Left menu → **Users** → click **Create user**.
3. **User name**: `zerobug-admin`.
4. Check **Provide user access to the AWS Management Console** (if you want the user to sign in to the Console) → choose **I want to create an IAM user** → set a **Custom password**.
5. Click **Next**.

![Create IAM User](/images/5-Workshop/5.2-Prerequisite/2.png)
![Create User](/images/5-Workshop/5.2-Prerequisite/3.png)
![Named User](/images/5-Workshop/5.2-Prerequisite/4.png)

**Step 2 – Attach AWS Managed Policies**

1. Choose **Attach policies directly**.
2. Search for and check the following built-in policies:
   - `AmazonCognitoPowerUser`
   - `AmazonAPIGatewayAdministrator`
   - `IAMReadOnlyAccess`
3. Click **Next** → review → **Create user**.

{{% notice tip %}}
These are **AWS Managed Policies** — Amazon already wrote the permission content (JSON) inside them, so you just check the boxes; there is **no need** to paste any JSON. You only write JSON when creating a **custom policy** (Create policy → JSON tab).
{{% /notice %}}

![Attach managed policies](/images/5-Workshop/5.2-Prerequisite/5.png)
![Finish Created User](/images/5-Workshop/5.2-Prerequisite/6.png)

#### 3. Create an Access Key for the AWS CLI

Some steps (e.g., setting a permanent password for the test user in 5.3.3, obtaining the JWT Token in 5.5) require the AWS CLI. To enable the CLI, create an Access Key:

1. **IAM** → **Users** → `zerobug-admin` → **Security credentials** tab.
2. **Access keys** → **Create access key** → choose **Command Line Interface (CLI)** → confirm → **Create access key**.
3. Save the **Access key ID** and **Secret access key** (the Secret is shown **only once**).

{{% notice warning %}}
Do **not** share or publish your **Secret access key**. After completing the workshop, **Deactivate** and **Delete** this access key (see section 5.6).
{{% /notice %}}

![Create Access Key](/images/5-Workshop/5.2-Prerequisite/7.png)
![Create Access Key](/images/5-Workshop/5.2-Prerequisite/8.png)
![Create Access Key](/images/5-Workshop/5.2-Prerequisite/9.png)

Configure the CLI:

```powershell
aws configure
# AWS Access Key ID     : <your access key>
# AWS Secret Access Key : <your secret key>
# Default region name   : ap-southeast-1
# Default output format : json
```

Verify the configuration:

```powershell
aws sts get-caller-identity
```

![Configure AWS CLI](/images/5-Workshop/5.2-Prerequisite/10.png)

#### 4. Install an API Testing Tool

Install **Postman** to send requests and inspect responses visually:

1. Download from [https://www.postman.com/downloads/](https://www.postman.com/downloads/).
2. Install and open Postman.

Or use **curl**, which is built into Windows 10/11 (call `curl.exe` in PowerShell). Verify:

```powershell
curl.exe --version
```