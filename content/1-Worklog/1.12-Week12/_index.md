---
title: "Week 12 Worklog"
date: 2026-01-01
weight: 12
chapter: false
pre: " <b> 1.12. </b> "
---

### Week 12 Objectives:

* Finalize documentation and evidence for the **TV2 layer** (S3, RDS, Secrets, pgvector, Bedrock).
* Prepare demo, thesis report, and data-layer resource cleanup per Workshop section 5.10.4.
* Accept the ZeroBug Agent project with the team before the defense.

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
      <td class="col-task">- Final review of TV2: S3, RDS, Secret, pgvector, Bedrock model access running stably <br> - Confirm the shared parameter table is complete before demo</td>
      <td class="col-date">07/06/2026</td>
      <td class="col-date">07/06/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">2</td>
      <td class="col-task">- Compile Deployment Guide for Kiet's scope: S3, RDS, Secrets Manager, pgvector, Bedrock Mantle model access <br> - Capture evidence: RDS Console, Secrets, `\d code_embeddings`, Bedrock Model access</td>
      <td class="col-date">07/07/2026</td>
      <td class="col-date">07/07/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">3</td>
      <td class="col-task">- Write thesis chapter "Data & Secrets Layer Deployment on AWS" (TV2) <br> - Describe lightweight RAG: pgvector `code_embeddings`, Mantle chat + embedding cross-region</td>
      <td class="col-date">07/08/2026</td>
      <td class="col-date">07/08/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">4</td>
      <td class="col-task">- Prepare slides: TV2 role, data flow diagram S3 → RDS → Bedrock Mantle <br> - Record a short demo video of the data infrastructure for the appendix</td>
      <td class="col-date">07/09/2026</td>
      <td class="col-date">07/09/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">5</td>
      <td class="col-task">- Defense Dry Run: questions on RDS private subnet, Secrets Manager, pgvector, Bedrock model access <br> - Explain why application schema is created by Toan (JPA) and vector table by Kiet</td>
      <td class="col-date">07/10/2026</td>
      <td class="col-date">07/10/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">6</td>
      <td class="col-task">- Verify data layer ready for Live Demo; confirm RDS metrics and S3 bucket have demo data <br> - Prepare Kiet cleanup checklist: RDS → Subnet Group → Secrets → S3 empty + delete</td>
      <td class="col-date">07/11/2026</td>
      <td class="col-date">07/11/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">7</td>
      <td class="col-task">- Complete report, slides, and store source/Workshop docs on Git <br> - After acceptance: clean up RDS, DB Subnet Group, Secret `zerobug/rds/credentials`, S3 bucket per 5.10.4 order</td>
      <td class="col-date">07/12/2026</td>
      <td class="col-date">07/12/2026</td>
      <td class="col-ref"></td>
    </tr>
  </tbody>
</table>


### Week 12 Achievements:

* Completed deployment documentation and thesis section for TV2 — Data & Secrets layer.
* ZeroBug Agent demo stable; ready to answer questions on S3, RDS, Secrets, pgvector, and Bedrock Mantle.
* Data-layer resources cleaned up per Workshop procedure, avoiding post-acceptance RDS/S3 costs.
