---
title : "Clean up Resources"
date : 2024-01-01
weight : 6
chapter : false
pre : " <b> 5.6. </b> "
---

Congratulations on completing the workshop to set up authentication and authorization for ZeroBug Agent with Amazon Cognito and API Gateway!

In this workshop, you have:
- Created an IAM User and granted permissions using AWS Managed Policies.
- Created an Amazon Cognito User Pool and App Client (Public client / SPA).
- Created the test account `admin@gmail.com` and set a permanent password.
- Built a REST API with the `/auth`, `/projects`, `/aws` resources, a Cognito Authorizer, and CORS, then deployed a `prod` stage.
- Verified the authentication flow: `401` without a token, `200` with a valid token, and renewal via a Refresh Token.

Clean up in the following order to avoid dependencies:

---

#### 1. Delete the API Gateway

1. Open the [API Gateway Console](https://console.aws.amazon.com/apigateway/).
2. Select the `zerobug-agent-api` API.
3. Go to **API settings** (or the **Actions** menu) → **Delete API**.
4. Type to confirm → **Delete**.

![Delete API Gateway](/images/5-Workshop/5.6-Cleanup/1.png)
![Delete API Gateway](/images/5-Workshop/5.6-Cleanup/2.png)

---

#### 2. Delete the Amazon Cognito User Pool

1. Open the [Cognito Console](https://console.aws.amazon.com/cognito/) → **User pools** → `zerobug-agent-user-pool`.
2. **Delete the Domain first** (required, otherwise it blocks pool deletion): **Domain** menu (or **Branding → Domain**) → **Delete Cognito domain**.
3. Go back → **Delete user pool** → type the name to confirm → **Delete**.

{{% notice warning %}}
Deleting the User Pool **permanently deletes** all user accounts in it. Make sure you no longer need the data before deleting.
{{% /notice %}}

![Delete Cognito User Pool](/images/5-Workshop/5.6-Cleanup/3.png)
![Delete Cognito User Pool](/images/5-Workshop/5.6-Cleanup/4.png)
![Delete Cognito User Pool](/images/5-Workshop/5.6-Cleanup/5.png)
![Delete Cognito User Pool](/images/5-Workshop/5.6-Cleanup/6.png)

---

#### 3. Deactivate and Delete the Access Key

The Access Key created in step 5.2 is no longer needed — delete it to reduce security risk:

1. Open the [IAM Console](https://console.aws.amazon.com/iam/) → **Users** → `zerobug-admin` → **Security credentials** tab.
2. **Access keys** → select the created key → **Actions** → **Deactivate** → then **Delete**.

![Delete Access Key](/images/5-Workshop/5.6-Cleanup/7.png)

---

#### 4. (Optional) Delete the IAM User

If you no longer need it, delete the IAM User as well:

1. **IAM** → **Users** → `zerobug-admin` → **Delete**.
2. Type the user name to confirm.

![Delete IAM User](/images/5-Workshop/5.6-Cleanup/8.png)
![Delete IAM User](/images/5-Workshop/5.6-Cleanup/9.png)

---

#### 5. Confirm No Billable Resources Remain

Check **AWS Billing / Cost Explorer** to ensure no resources keep generating costs. Cognito includes 50,000 free monthly active users, but it is still best to delete it when unused to keep your account tidy.