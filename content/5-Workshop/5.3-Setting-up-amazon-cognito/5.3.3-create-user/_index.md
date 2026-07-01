---
title : "Create test user account"
date : 2024-01-01 
weight : 3
chapter : false
pre : " <b> 5.3.3 </b> "
---

#### Create a Test User Account (admin@gmail.com)

After creating the User Pool and App Client, create a test account to verify the authentication flow in step 5.5.

**Step 1 – Create the user in the Console**

1. In the `zerobug-agent-user-pool` User Pool → left menu **Users** → click **Create user**.
2. Fill in:
   - **Invitation message**: choose **Don't send an invitation**.
   - **Email address**: `admin@gmail.com` — check **Mark email address as verified**.
   - **Password**: choose **Set a password** → enter `Admin@12345`.
3. Click **Create user**.

![Create user](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.3/1.png)
![Create user](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.3/2.png)

**Step 2 – Handle the "Force change password" status**

After creation, the user usually shows **Confirmation status: Force change password**. This is Cognito's default behavior: any password set by an **admin** is treated as *temporary*, and the first sign-in forces a password change — which is inconvenient when obtaining a token in step 5.5 (you hit a `NEW_PASSWORD_REQUIRED` challenge).

![Force change password](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.3/3.png)

To switch to **Confirmed**, set the password to **permanent** using the AWS CLI. Open PowerShell and run:

```powershell
aws cognito-idp admin-set-user-password --user-pool-id ap-southeast-1_GevSgtD8j --username admin@gmail.com --password "Admin@12345" --permanent --region ap-southeast-1
```

{{% notice note %}}
The Console currently has **no** button to make a password permanent, so the CLI command `admin-set-user-password --permanent` is the most reliable way. If the CLI reports *"Unable to locate credentials"*, configure `aws configure` as in step 5.2.
{{% /notice %}}

![AWS CLI](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.3/4.png)

**Step 3 – Verify the result**

Go back to the **Users** tab → **refresh**. The status of `admin@gmail.com` changes to **Confirmed**.

![User Confirmed](/images/5-Workshop/5.3-Setting-up-amazon-cognito/5.3.3/5.png)

{{% notice tip %}}
Save the sign-in details for use in step 5.5:

| Information | Value |
| --- | --- |
| Email | `admin@gmail.com` |
| Password | `Admin@12345` |
{{% /notice %}}
