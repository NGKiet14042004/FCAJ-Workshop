---
title: "Week 4 Worklog"
date: 2026-01-01
weight: 4
chapter: false
pre: " <b> 1.4. </b> "
---

### Week 4 Objectives:

* Research the mechanism for granting application permissions to access AWS services via AWS IAM.
* Analyze the security risks of using Access Key / Secret Access Key.
* Practice deploying an advanced security solution by applying an IAM Role directly to an EC2 Instance.

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
      <td class="col-task">- Explore the application authorization problem when interacting with AWS resources <br> - Set up prerequisite infrastructure: create an EC2 Instance and an S3 Bucket for the lab</td>
      <td class="col-date">05/11/2026</td>
      <td class="col-date">05/11/2026</td>
      <td class="col-ref">https://000048.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">2</td>
      <td class="col-task">- Study Access Key authorization: create an IAM User and generate an Access Key / Secret Access Key pair</td>
      <td class="col-date">05/12/2026</td>
      <td class="col-date">05/12/2026</td>
      <td class="col-ref">https://000048.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">3</td>
      <td class="col-task">- Practice configuring and using Access Keys so that the EC2 application can connect to and interact with data in the S3 Bucket</td>
      <td class="col-date">05/13/2026</td>
      <td class="col-date">05/13/2026</td>
      <td class="col-ref">https://000048.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">4</td>
      <td class="col-task">- Deep-dive analysis of security risks when storing Access Keys in source code <br> - Understand why static Access Keys should not be used for real-world applications</td>
      <td class="col-date">05/14/2026</td>
      <td class="col-date">05/14/2026</td>
      <td class="col-ref">https://000048.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">5</td>
      <td class="col-task">- Research the safer alternative using IAM Roles <br> - Create a new IAM Role with the appropriate Policy to access S3 in place of Access Keys</td>
      <td class="col-date">05/15/2026</td>
      <td class="col-date">05/15/2026</td>
      <td class="col-ref">https://000048.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">6</td>
      <td class="col-task">- Attach the IAM Role to the EC2 Instance Profile <br> - Test access from EC2 to S3 without configuring any static key pair</td>
      <td class="col-date">05/16/2026</td>
      <td class="col-date">05/16/2026</td>
      <td class="col-ref">https://000048.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">7</td>
      <td class="col-task">- Evaluate the automatic rotation mechanism of Temporary Credentials provided by IAM Roles <br> - Clean up all created resources (EC2, S3, IAM) to optimize costs</td>
      <td class="col-date">05/17/2026</td>
      <td class="col-date">05/17/2026</td>
      <td class="col-ref">https://000048.awsstudygroup.com</td>
    </tr>
  </tbody>
</table>


### Week 4 Achievements:

* Clearly understood and differentiated the security levels between static Access Keys and dynamic IAM Roles.
* Proficient in creating, configuring, and attaching IAM Roles to EC2 for safe AWS resource access.
* Successfully applied cloud security standards, eliminating hardcoded credentials from application source code.
* Completed a proper resource cleanup process, protecting the Free Tier account from unexpected charges.
