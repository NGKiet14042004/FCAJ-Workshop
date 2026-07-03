---
title: "Week 10 Worklog"
date: 2026-01-01
weight: 10
chapter: false
pre: " <b> 1.10. </b> "
---

### Week 10 Objectives:

* Deploy the **TV2 — Data & Secrets layer** for ZeroBug Agent per Workshop section 5.4.
* Set up S3, RDS PostgreSQL, Secrets Manager, pgvector, and enable Bedrock Mantle model access.
* Complete the verification checklist and hand off parameters to Toan and Hoa.

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
      <td class="col-task">- Receive handoff from Tri: Private Subnet A/B, `zerobug-rds-sg`, ARN `zerobug-ec2-role` & `zerobug-lambda-role` <br> - Review the shared parameter table and prepare TV2 deployment</td>
      <td class="col-date">06/22/2026</td>
      <td class="col-date">06/22/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">2</td>
      <td class="col-task">- Create private S3 bucket `zerobug-projects-<suffix>` (ap-southeast-1), enable Block Public Access <br> - Test upload/download; record bucket name in the parameter table</td>
      <td class="col-date">06/23/2026</td>
      <td class="col-date">06/23/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">3</td>
      <td class="col-task">- Create DB Subnet Group and RDS PostgreSQL 15.x (`zerobug-db`) in Private Subnet, Public access = No <br> - Copy RDS endpoint; DB name `zerobug`</td>
      <td class="col-date">06/24/2026</td>
      <td class="col-date">06/24/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">4</td>
      <td class="col-task">- Store RDS credentials in Secrets Manager (`zerobug/rds/credentials`), copy Secret ARN <br> - Run pgvector SQL: `CREATE EXTENSION vector` + `code_embeddings` table (vector 1024)</td>
      <td class="col-date">06/25/2026</td>
      <td class="col-date">06/25/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">5</td>
      <td class="col-task">- Enable Bedrock Mantle model access in `us-east-1`: `openai.gpt-oss-120b` and `cohere.embed-multilingual-v3` <br> - Record Mantle base URL, model IDs, and embedding dimension in the parameter table</td>
      <td class="col-date">06/26/2026</td>
      <td class="col-date">06/26/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">6</td>
      <td class="col-task">- Run TV2 verification checklist: S3, RDS Available, Secret, pgvector, Bedrock Access granted <br> - Do not create application tables manually — Toan deploys via JPA (`ddl-auto=update`)</td>
      <td class="col-date">06/27/2026</td>
      <td class="col-date">06/27/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">7</td>
      <td class="col-task">- Hand off to Toan: S3 bucket, RDS endpoint, DB Secret ARN <br> - Hand off to Hoa: S3, DB Secret, RDS endpoint, Mantle URL/models, `code_embeddings` table, RAG top-k</td>
      <td class="col-date">06/28/2026</td>
      <td class="col-date">06/28/2026</td>
      <td class="col-ref"></td>
    </tr>
  </tbody>
</table>


### Week 10 Achievements:

* Completed TV2: private S3, RDS PostgreSQL, Secrets Manager, pgvector + `code_embeddings`.
* Successfully enabled Bedrock Mantle model access (chat + embedding) in `us-east-1`.
* Shared parameter table filled; successful handoff to Toan and Hoa per Workshop checklist.
