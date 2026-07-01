---
title: "Workshop"
date: 2024-01-01
weight: 5
chapter: false
pre: " <b> 5. </b> "
---

# ZeroBug Agent – Authentication and Authorization with Amazon Cognito and API Gateway

#### Overview

**ZeroBug Agent** uses **Amazon Cognito** as the Identity Provider and **Amazon API Gateway** as the gateway protecting the entire REST API flow. This workshop guides you through setting up an end-to-end authentication system, from creating a User Pool and configuring an App Client to protecting APIs with a JWT Authorizer.

After completing this workshop, you will have a complete authentication flow:

```
User signs in → Amazon Cognito issues a JWT Token (IdToken)
    → Front-end (Vite SPA / Electron) attaches the token to the Authorization header
    → Amazon API Gateway validates the token via the Cognito Authorizer
    → ALB → EC2 Spring Boot (Backend)
```

#### Content

1. [Introduction](5.1-Workshop-overview/)
2. [Prerequisites](5.2-Prerequiste/)
3. [Setting up Amazon Cognito](5.3-Setting-up-amazon-cognito/)
4. [Configuring Amazon API Gateway](5.4-Configuring-amazon-api-gateway/)
5. [Testing the Authentication Flow](5.5-Testing-the-authentication-flow/)
6. [Clean up Resources](5.6-Cleanup/)
