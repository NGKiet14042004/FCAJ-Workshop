---
title: "Week 9 Worklog"
date: 2026-01-01
weight: 9
chapter: false
pre: " <b> 1.9. </b> "
---

### Week 9 Objectives:

* Research and develop the overall idea for the ZeroBug Agent graduation project; identify the core problem and technologies.
* Design an optimized, secure, and scalable System Architecture Diagram.
* Define team roles and the **TV2 — Data & Secrets layer** (S3, RDS, Secrets, pgvector, Bedrock model access) owned by Kiet.

### Tasks to be carried out this week:
<table class="worklog-table">
<colgroup>
  <col class="col-day" style="width:5%">
  <col class="col-task" style="width:42%">
  <col class="col-start" style="width:13%">
  <col class="col-end" style="width:13%">
  <col class="col-ref" style="width:27%">
</colgroup>
  <thead>
    <tr>
      <th>Day</th>
      <th>Task</th>
      <th>Start Date</th>
      <th>Completion Date</th>
      <th>Reference Material</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td class="col-day">1</td>
      <td class="col-task">- Survey the ZeroBug Agent topic; analyze AI Unit Test generation requirements <br> - Define the flow: Import source → Context Builder (RAG) → Bedrock Mantle chat</td>
      <td class="col-date">06/15/2026</td>
      <td class="col-date">06/15/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">2</td>
      <td class="col-task">- Draft Data Flow: S3 source → Lambda embed → RDS pgvector → Mantle chat <br> - Assign 5 members: Tri → Kiet → Toan → Hoa → Trinh</td>
      <td class="col-date">06/16/2026</td>
      <td class="col-date">06/16/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">3</td>
      <td class="col-task">- Design the overall High-Level Architecture diagram <br> - Define Public/Private Subnets; RDS in Private Subnet (depends on Tri completing VPC first)</td>
      <td class="col-date">06/17/2026</td>
      <td class="col-date">06/17/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">4</td>
      <td class="col-task">- Choose RDS PostgreSQL 15.x + pgvector for lightweight RAG (`code_embeddings` table, dimension 1024) <br> - Design a private S3 bucket for source and `deploy/` JAR prefix</td>
      <td class="col-date">06/18/2026</td>
      <td class="col-date">06/18/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">5</td>
      <td class="col-task">- Research Bedrock Mantle (`us-east-1`): chat model `openai.gpt-oss-120b` and embedding `cohere.embed-multilingual-v3` <br> - Plan Secrets Manager for RDS credentials (`zerobug/rds/credentials`)</td>
      <td class="col-date">06/19/2026</td>
      <td class="col-date">06/19/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">6</td>
      <td class="col-task">- Draft the shared parameter table (S3, RDS endpoint, Secret ARN, Mantle URL/models, vector table) <br> - Estimate RDS, NAT, and Bedrock inference costs; compare against Free Tier</td>
      <td class="col-date">06/20/2026</td>
      <td class="col-date">06/20/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">7</td>
      <td class="col-task">- Finalize architecture docs and TV2 deployment checklist (Workshop section 5.4) <br> - Prepare handoff: Kiet deploys after Tri completes IAM + VPC</td>
      <td class="col-date">06/21/2026</td>
      <td class="col-date">06/21/2026</td>
      <td class="col-ref"></td>
    </tr>
  </tbody>
</table>


### Week 9 Achievements:

* Clearly defined ZeroBug Agent with a lightweight RAG pipeline on RDS pgvector.
* Completed the architecture diagram and role split: Kiet owns TV2 (S3 + RDS + Secrets + pgvector + Bedrock model access).
* Established handoff parameters for Toan (S3, RDS, Secret) and Hoa (Mantle URL/models, `code_embeddings` table).
* Ready to deploy infrastructure in order: Tri → Kiet → Toan → Hoa → Trinh.
