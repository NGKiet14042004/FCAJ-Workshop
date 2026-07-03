---
title: "Week 11 Worklog"
date: 2026-01-01
weight: 11
chapter: false
pre: " <b> 1.11. </b> "
---

### Week 11 Objectives:

* Monitor and test the TV2 data layer (S3, RDS, Secrets, pgvector, Bedrock model access) on the team environment.
* Configure CloudWatch for RDS, test Secrets get-value, and debug pgvector during Lambda/EC2 integration.
* Support the team on DB, Secret, and embedding-dimension issues during E2E scenarios.

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
      <td class="col-task">- Verify E2E checklist for Kiet: S3 upload OK; RDS Available; DB Secret; pgvector + `code_embeddings`; Bedrock model access <br> - Coordinate team Step Functions runs after Toan/Hoa finish deployment</td>
      <td class="col-date">06/29/2026</td>
      <td class="col-date">06/29/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">2</td>
      <td class="col-task">- Set up CloudWatch metrics for RDS (`CPUUtilization`, connections) <br> - Test Secrets get-value from EC2/Lambda roles; configure RDS CPU > 80% alarm</td>
      <td class="col-date">06/30/2026</td>
      <td class="col-date">06/30/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">3</td>
      <td class="col-task">- Verify pgvector on psql: `\dx` (vector extension), `\d code_embeddings` <br> - Debug `extension "vector" does not exist` or dimension mismatch (1024)</td>
      <td class="col-date">07/01/2026</td>
      <td class="col-date">07/01/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">4</td>
      <td class="col-task">- Verify RDS connectivity from EC2 (Toan) and Lambda (Hoa) via Secret — no hardcoded passwords <br> - Review RDS and Bedrock inference costs in Cost Explorer</td>
      <td class="col-date">07/02/2026</td>
      <td class="col-date">07/02/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">5</td>
      <td class="col-task">- Support Bedrock Mantle debugging: model access denied, embedding 400, cross-region timeout via NAT <br> - Confirm `cohere.embed-multilingual-v3` and dimension 1024 match `code_embeddings` table</td>
      <td class="col-date">07/03/2026</td>
      <td class="col-date">07/03/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">6</td>
      <td class="col-task">- Create RDS Snapshot as backup for metadata and RAG vector data <br> - Verify S3 bucket still has source objects and `deploy/` JAR prefix</td>
      <td class="col-date">07/04/2026</td>
      <td class="col-date">07/04/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">7</td>
      <td class="col-task">- Run data-layer Regression Testing with the team (E2E checklist 5.8) <br> - Confirm TV2 is stable before finalization and demo</td>
      <td class="col-date">07/05/2026</td>
      <td class="col-date">07/05/2026</td>
      <td class="col-ref"></td>
    </tr>
  </tbody>
</table>


### Week 11 Achievements:

* TV2 layer (S3, RDS, Secrets, pgvector, Bedrock model access) runs stably on the team environment.
* RDS monitoring and Secrets testing set up successfully; resolved pgvector/embedding dimension issues.
* RDS Snapshot backup completed; ready to support demo and Week 12 resource cleanup.
