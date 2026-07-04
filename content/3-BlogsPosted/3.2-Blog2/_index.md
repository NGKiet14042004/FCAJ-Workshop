---
title: "Blog 2"
date: 2024-01-01
weight: 2
chapter: false
pre: " <b> 3.2. </b> "
---

# [AWS Architecture] Building a Scalable User Search Layer on Top of Amazon Cognito

Hello everyone in the AWS Study Group VN community!

**Amazon Cognito** is a widely used identity and user authentication management service on AWS. However, as the number of accounts grows to thousands or tens of thousands of users, search requirements often exceed Cognito's default capabilities.

To solve this problem, the AWS Architecture Blog introduced a solution for building a dedicated search layer alongside Cognito by combining **AWS Lambda**, **Amazon DynamoDB**, and **Amazon OpenSearch Serverless**. This solution extends search capabilities, improves performance, and maintains system scalability.

I'd like to share some highlights after studying this architecture.

---

## 1. Why Extend Cognito's Search Capabilities?

Amazon Cognito provides the `ListUsers` API to search users by basic attributes. However, in real enterprise scenarios, requirements are often more complex:

- Search by partial email or username
- Fuzzy search when typos occur
- Filter by permission groups (Groups)
- Combine multiple query conditions simultaneously
- Search on custom attributes

When user volume grows large, relying entirely on Cognito can impact search experience and system scalability.

---

## 2. Solution Highlights

### Dedicated Search Layer Separation

Instead of querying Cognito directly for every search, AWS proposes building a separate **Search Layer** using **Amazon OpenSearch Serverless**. All user data is synchronized from Cognito to OpenSearch to serve search operations.

This approach helps:

- Reduce load on Cognito
- Improve response speed
- Support advanced search features
- Scale easily as user count grows

### High Performance with OpenSearch Serverless

Data indexed on OpenSearch Serverless enables the system to:

- Search nearly instantaneously
- Support **Fuzzy Search**
- Support **Auto Suggest**
- Combine complex filters
- Maintain stable performance as data grows

This is a major advantage for systems with large user bases such as SaaS, CRM, or e-commerce platforms.

### Real-Time Data Synchronization

Notably, AWS uses an **Event-Driven** architecture for data synchronization. Whenever a user registers, signs in, or has their information updated, data is automatically recorded and updated in the search system without periodic sync jobs. This keeps data consistent and significantly reduces operational costs.

---

## 3. System Workflow

The solution includes two main flows:

![Scalable User Search Layer Architecture on Amazon Cognito](/images/3-BlogsPosted/3.2-Blog2/blog2.png)

### User Interaction with Cognito

Users register or sign in through **Amazon Cognito**. Cognito **Lambda Triggers** are activated to record or update user information in **DynamoDB**. Then:

- **DynamoDB Streams** detect data changes
- **Lambda** processes the new data
- **OpenSearch** updates the corresponding index

This keeps search data synchronized in near real-time.

### Administrator Data Updates

For operations such as creating users, locking accounts, updating attributes, or adding users to Groups:

- **AWS CloudTrail** records the event
- **Amazon EventBridge** detects the change and triggers Lambda to update data in DynamoDB and OpenSearch

This ensures every change in Cognito is reflected in the search system.

---

## 4. Notable Search Capabilities

Thanks to OpenSearch Serverless, the system supports flexible search forms:

| Search Type | Description | Example |
| --- | --- | --- |
| **Exact Match** | Exact search by email, username, phone number | `admin@gmail.com` |
| **Prefix Match** | Search by prefix | Enter `nguy` → returns `nguyenan@gmail.com`, `nguyenthanh@gmail.com` |
| **Fuzzy Search** | Approximate search when typos occur | Enter `nguyne` still finds `nguyen` |
| **Complex Filtering** | Combine multiple criteria: group, status, registration date, email, phone | Filter USER + active + registered in June |

These features are very useful for operations and customer support teams.

---

## Personal Perspective

In my view, the greatest value of this solution lies not in OpenSearch itself, but in how AWS built the data synchronization flow using an **Event-Driven** architecture.

Instead of continuously querying Cognito directly, the system uses **DynamoDB Streams**, **EventBridge**, and **Lambda** to automatically process all data changes. This makes the architecture both flexible and easy to scale as user count grows.

This is also a very common architecture pattern in modern systems, where each service focuses on its specific role: **Cognito** manages identity, **DynamoDB** stores data, **OpenSearch** serves search, and **Lambda** handles events.

---

## Conclusion

Combining **Amazon Cognito**, **AWS Lambda**, **DynamoDB Streams**, and **Amazon OpenSearch Serverless** delivers a powerful, flexible, and highly scalable user search solution.

The solution not only overcomes Cognito's default search limitations but also provides advanced search with high performance, near real-time data synchronization, and support for complex filtering.

This is an architecture worth referencing for SaaS, CRM, e-commerce systems, or any application managing large user volumes on AWS.

**Reference:**

[Building a scalable user search layer on top of Amazon Cognito](https://aws.amazon.com/blogs/architecture/building-a-scalable-user-search-layer-on-top-of-amazon-cognito/)

I welcome feedback and discussion from the community!
