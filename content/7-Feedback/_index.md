---
title: "Sharing and Feedback"
date: 2024-01-01
weight: 7
chapter: false
pre: " <b> 7. </b> "
---

> This is where I share my experiences, reflections, and feedback after 12 weeks of participating in the **First Cloud AI Journey** program and building the **ZeroBug Agent** project on the AWS platform.

### Overall Evaluation

**1. Program Quality**

The program is very well structured, covering everything from foundational knowledge (Free Tier, IAM, EC2, VPC, RDS, S3) to advanced services (Bedrock, Lambda, Step Functions, Cognito, API Gateway). The 12-week roadmap helped me build knowledge systematically without being overwhelmed by the breadth of the AWS ecosystem. In particular, combining theory with hands-on workshops reinforced the knowledge very effectively.

**2. Documentation and Learning Resources**

The program's documentation is high quality, written clearly with detailed illustrations. The workshops on awsstudygroup.com are regularly updated and closely follow the actual AWS console. However, some newer services like **Amazon Bedrock AgentCore** lack complete Vietnamese documentation, requiring me to self-study from English AWS documentation.

**3. Relevance Between Program and Project**

The knowledge learned from weeks 1 through 8 (IAM, EC2, RDS, S3, CloudFront, etc.) was directly applied to the ZeroBug Agent architecture. This creates a tight connection between learning content and the real-world project — I wasn't just learning in theory but truly understanding "why" each service was chosen.

**4. Learning and Skill Development Opportunities**

The 12 weeks took me from being completely new to AWS to being able to design and deploy a production-grade cloud system. In particular, the experience of integrating **Amazon Bedrock** and **Claude 3 Haiku** into the automated Unit Test generation workflow was the biggest technical highlight I gained from the program.

**5. Biggest Challenges and Lessons Learned**

- **Most difficult technical challenge**: Configuring the JWT Authorizer to correctly integrate between the Cognito User Pool and API Gateway, handling the token refresh flow for the SPA, and ensuring CORS worked in both dev and production environments.
- **Most important lesson**: Never hardcode Access Keys into source code. Always use IAM Roles and Temporary Credentials. This is the core cloud security principle I will carry throughout my entire career.

**6. Policies and Benefits**

The $200 AWS Credit package provided through the program is a very practical benefit, allowing me to practice without worrying about costs. The clear guidance on controlling Budgets and Billing Alerts from the beginning of the program also gave me the confidence to experiment with new services.

---

### Additional Questions

- What did you find **most satisfying** about participating in the program?

  → Being able to practice directly in a real AWS environment and build a complete product that can go into my portfolio.

- What do you think the program **should improve**?

  → Adding more livestream Q&A sessions or office hours so learners can ask questions directly when facing complex technical problems.

- If recommending to a friend, would you **suggest they join**? Why?

  → Yes, I would recommend it to anyone who wants to learn Cloud and AI in a hands-on way, especially IT students who want to add real-world cloud skills to their resume.

---

### Suggestions and Expectations

- I hope the program adds more modules on **Kubernetes on AWS (EKS)** and **DevOps CI/CD** (CodePipeline, CodeBuild) to complete the cloud engineer skillset.
- I hope to see more content on **Multi-account AWS Organizations** and **AWS Control Tower** for those who want to build large-scale enterprise systems.
- Continue to maintain the program and expand it to more universities to grow the AWS community in Vietnam.
