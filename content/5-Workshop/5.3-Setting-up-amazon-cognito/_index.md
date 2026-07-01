---
title : "Setting up Amazon Cognito"
date : 2024-01-01
weight : 3
chapter : false
pre : " <b> 5.3. </b> "
---

{{% notice note %}}
Please log in to the previously created **IAM User** account to proceed with the next steps.
{{% /notice %}}

#### Overview

**Amazon Cognito User Pool** is the user identity management service, responsible for:

- User registration and email verification.
- Authentication and issuing JWT Tokens (IdToken, AccessToken, RefreshToken).
- Managing the account lifecycle and password resets.

In this section, you will create a User Pool, configure an App Client suitable for the Vite SPA (Public client / SPA), and create the first test user account.

#### Content

- [Create User Pool](5.3.1-create-gwe/)
- [Configure App Client](5.3.2-test-gwe/)
- [Create test user account](5.3.3-create-user/)
