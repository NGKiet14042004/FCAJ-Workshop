---
title : "Configuring Amazon API Gateway"
date : 2024-01-01
weight : 4
chapter : false
pre : " <b> 5.4. </b> "
---

#### Overview

**Amazon API Gateway** serves as the sole public entry point for all of ZeroBug Agent's REST APIs. Every request from the Vite SPA or Electron passes through API Gateway before being forwarded to ALB → EC2 Spring Boot in the Private Subnet.

API Gateway in this project performs the following tasks:

- Define and manage Routes (`/auth`, `/projects`, `/aws`, ...).
- Validate JWT Tokens through a **JWT Authorizer** integrated with Cognito.
- Handle **CORS** for the Vite SPA running on a different domain.
- Provide staging/production environments via **Deployment Stages**.

#### Content

- [Create REST API](5.4.1-prepare/)
- [Define Resources and Methods](5.4.2-create-interface-enpoint/)
- [Configure JWT Authorizer](5.4.3-test-endpoint/)
- [Configure CORS for Vite SPA](5.4.4-dns-simulation/)
- [Deploy to Stage](5.4.5-deploy-stage/)
