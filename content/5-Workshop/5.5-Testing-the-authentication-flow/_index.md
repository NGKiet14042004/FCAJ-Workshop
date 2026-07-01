---
title : "Testing the Authentication Flow"
date : 2024-01-01
weight : 5
chapter : false
pre : " <b> 5.5. </b> "
---

After completing the Cognito User Pool, App Client, and the Cognito Authorizer on API Gateway, test the entire authentication flow: obtain a JWT Token, call the API with/without a token, and refresh the token.

{{% notice note %}}
The `aws` commands and the `$token` variable syntax in this section run in **PowerShell** (the `PS C:\...>` prompt). If you are in Command Prompt (`C:\...>`), type `powershell` and press Enter to switch to PowerShell.
{{% /notice %}}

---

### 5.5.1. Sign In and Receive a JWT Token

Use the AWS CLI with the `USER_PASSWORD_AUTH` flow (enabled in step 5.3.2) to obtain a token and store it in the `$token` variable:

```powershell
$token = (aws cognito-idp initiate-auth --auth-flow USER_PASSWORD_AUTH --client-id 4kmjdov040cmrulog2fmmcgnr7 --auth-parameters USERNAME=admin@gmail.com,PASSWORD=Admin@12345 --region ap-southeast-1 --no-cli-pager | ConvertFrom-Json).AuthenticationResult.IdToken
```

```
echo $token
```

**Expected result:** the command prints the **IdToken** string (3 parts separated by `.`). Cognito's raw response also includes `AccessToken`, `RefreshToken`, and `ExpiresIn: 3600` (the token lives for 1 hour).

{{% notice note %}}
A REST API Cognito Authorizer authenticates using the **IdToken** by default. So we take the `IdToken` (not the `AccessToken`) for the following API calls.
{{% /notice %}}

Also store the Refresh Token for use in 5.5.3:

```powershell
$refresh = (aws cognito-idp initiate-auth --auth-flow USER_PASSWORD_AUTH --client-id 4kmjdov040cmrulog2fmmcgnr7 --auth-parameters USERNAME=admin@gmail.com,PASSWORD=Admin@12345 --region ap-southeast-1 --no-cli-pager | ConvertFrom-Json).AuthenticationResult.RefreshToken
```

![Obtain JWT Token](/images/5-Workshop/5.5-Testing-the-authentication-flow/1.png)

---

### 5.5.2. Call a Protected API with a Bearer Token

#### Option 1 – Using curl in PowerShell

**Call WITHOUT a token (expect 401):**

```powershell
curl.exe -i https://59d9m03f78.execute-api.ap-southeast-1.amazonaws.com/prod/projects
```

Result: `HTTP/1.1 401 Unauthorized`, body `{"message":"Unauthorized"}`.

**Call WITH a token (expect 200):**

```powershell
curl.exe -i -H "Authorization: $token" https://59d9m03f78.execute-api.ap-southeast-1.amazonaws.com/prod/projects
```

Result: `HTTP/1.1 200 OK`.

#### Option 2 – Using Postman

**No-token case (401):**

1. Create a **GET** request to `https://sb9qx62pe9.execute-api.ap-southeast-1.amazonaws.com/prod/projects`.
2. **Authorization** tab: leave **No Auth** → **Send**.
3. Result: **Status 401 Unauthorized**, body `{"message":"Unauthorized"}`.

![Call without token - 401](/images/5-Workshop/5.5-Testing-the-authentication-flow/2.png)

**Valid-token case (200):**

1. In the same request, **Authorization** tab → **Auth Type**: **Bearer Token** → paste the IdToken string (from `echo $token`).
2. Click **Send**.
3. Result: **Status 200 OK**.

![Call with token - 200](/images/5-Workshop/5.5-Testing-the-authentication-flow/3.png)

{{% notice warning %}}
With a REST API + Cognito Authorizer, the `Authorization` header takes the **raw token string**, no `Bearer ` prefix is required. If you add it manually in the **Headers** tab, paste only the token; if you use **Bearer Token**, Postman adds "Bearer " and API Gateway still extracts the token part correctly.
{{% /notice %}}

{{% notice note %}}
Comparing the results:
- **No token** → `401 Unauthorized` (blocked by the Cognito Authorizer before reaching the backend).
- **Valid token** → `200 OK` (passes authentication).

This proves the JWT authentication flow works correctly.
{{% /notice %}}

---

### 5.5.3. Test Token Expiration and Refresh Token

#### Inspect token content & expiration

The IdToken lives for 1 hour. Open [jwt.io](https://jwt.io) and paste the token to view the payload:

```json
{
  "iss": "https://cognito-idp.ap-southeast-1.amazonaws.com/ap-southeast-1_GevSgtD8j",
  "aud": "4kmjdov040cmrulog2fmmcgnr7",
  "token_use": "id",
  "email": "admin@gmail.com",
  "email_verified": true,
  "iat": 1782726059,
  "exp": 1782729659
}
```

Verify: `exp - iat = 3600 seconds = 1 hour` → matches `ExpiresIn`. After `exp`, the token is rejected (`401`).

{{% notice note %}}
API Gateway trusts the token because: the signature is valid (per the pool's JWKS), `iss` matches the User Pool, `aud` matches the App Client, `token_use = id`, and `exp` has not passed. If any of these is wrong → `401`.
{{% /notice %}}

![Decode token at jwt.io](/images/5-Workshop/5.5-Testing-the-authentication-flow/6.png)

#### Simulate an expired / invalid token

Without waiting an hour, you can change one character in the token (making it invalid) and call again → it returns **401**, demonstrating that API Gateway rejects invalid/expired tokens.

```powershell
curl.exe -i -H "Authorization: invalidToken123" https://sb9qx62pe9.execute-api.ap-southeast-1.amazonaws.com/prod/projects
```

#### Use the Refresh Token to obtain a new IdToken

When the token expires, use the Refresh Token to get a new one without signing in again:

```powershell
$new = (aws cognito-idp initiate-auth --auth-flow REFRESH_TOKEN_AUTH --client-id 4kmjdov040cmrulog2fmmcgnr7 --auth-parameters REFRESH_TOKEN=$refresh --region ap-southeast-1 --no-cli-pager | ConvertFrom-Json).AuthenticationResult.IdToken
```

```
echo $new
```

Then call the API again with the new token (Postman or curl) → **200 OK**.

![Refresh Token success](/images/5-Workshop/5.5-Testing-the-authentication-flow/4.png)
![Refresh Token success](/images/5-Workshop/5.5-Testing-the-authentication-flow/5.png)

{{% notice note %}}
The complete flow: **Login → IdToken (1h)** → when it expires → **use the RefreshToken → new IdToken** (no password re-entry). In a Vite SPA, the `amazon-cognito-identity-js` library is typically used to refresh tokens automatically.
{{% /notice %}}
