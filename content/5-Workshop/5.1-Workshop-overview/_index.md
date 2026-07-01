---
title : "Introduction"
date : 2024-01-01 
weight : 1 
chapter : false
pre : " <b> 5.1. </b> "
---

#### Overview of Authentication and Authorization in ZeroBug Agent

**ZeroBug Agent** is a web + desktop platform, so protecting all APIs from unauthorized access is a mandatory requirement. The system uses an authentication model based on **JSON Web Token (JWT)**, combining **Amazon Cognito User Pool** (which issues tokens) and **Amazon API Gateway** with a **Cognito Authorizer** (which validates tokens).

In this workshop, you will build the entire authentication flow yourself: create a User Pool, configure an App Client for the Vite SPA, protect the REST API with a Cognito Authorizer, and then verify everything by obtaining a JWT Token and calling the API.

#### Main Authentication Flow

```
[Vite SPA / Electron Desktop Client]
        │
        │  1. Sign in (username + password) via Amazon Cognito
        ▼
[Amazon Cognito – User Pool]
        │
        │  2. Returns: IdToken, AccessToken, RefreshToken
        ▼
[Front-end stores the tokens]
        │
        │  3. Calls API with header: Authorization: <IdToken>
        ▼
[Amazon API Gateway – REST API + Cognito Authorizer]
        │
        │  4. Authorizer validates the token against Cognito User Pool (JWKS)
        ▼
[Application Load Balancer – Public Subnet]
        │
        ▼
[Amazon EC2 – Spring Boot Backend – Private Subnet]
        │
        ▼
[Response returned to Client]
```

{{% notice note %}}
With a **REST API + Cognito Authorizer**, the token is placed **directly** in the `Authorization` header (the raw token string, **without** the `Bearer ` prefix). This is an important difference compared to the HTTP API JWT Authorizer.
{{% /notice %}}

#### Participating Components

| Component | Role |
| --- | --- |
| **Amazon Cognito User Pool** | Manages user accounts, issues JWT Tokens, verifies email |
| **App Client (Cognito)** | Configured for the Vite SPA — **Public client / SPA** type (no Client Secret) |
| **Amazon API Gateway** | Public REST API gateway; a Cognito Authorizer protects the routes |
| **Cognito Authorizer** | Automatically validates tokens against the Cognito User Pool before forwarding the request |
| **EC2 Spring Boot** | Backend that receives authenticated requests and handles business logic |

#### Workshop Scope

This workshop focuses on **end-to-end authentication** with Cognito and API Gateway:

- Create and configure an Amazon Cognito User Pool + App Client (SPA).
- Create a REST API with the resources `/auth`, `/projects`, `/aws`.
- Protect the API with a Cognito Authorizer; configure CORS; deploy a `prod` stage.
- Obtain a JWT Token and verify: no token → `401`, valid token → `200`, use a Refresh Token to obtain a new token.

![Workshop Overview](/images/5-Workshop/5.1-Workshop-overview/diagram1.png)
