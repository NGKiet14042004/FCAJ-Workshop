---
title: "Week 10 Worklog"
date: 2026-01-01
weight: 10
chapter: false
pre: " <b> 1.10. </b> "
---

### Week 10 Objectives:

* Create and configure core AWS infrastructure services according to the designed architecture diagram.
* Deploy application source code (Back-end and Front-end) to the cloud environment.
* Establish a secure connection between the application server and the database management system on AWS.

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
      <td class="col-task">- Configure a secure network environment: create VPC, Public/Private Subnets, Internet Gateway, and NAT Gateway <br> - Set up Security Groups and Network ACLs to control traffic flow</td>
      <td class="col-date">06/22/2026</td>
      <td class="col-date">06/22/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">2</td>
      <td class="col-task">- Create Amazon RDS in a Private Subnet to ensure data security <br> - Configure access credentials, authorization, and import schema/seed data into the database</td>
      <td class="col-date">06/23/2026</td>
      <td class="col-date">06/23/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">3</td>
      <td class="col-task">- Launch an Amazon EC2 Instance as the Application Server <br> - Configure the Runtime environment, install required tools, and set up AWS CLI on the server</td>
      <td class="col-date">06/24/2026</td>
      <td class="col-date">06/24/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">4</td>
      <td class="col-task">- Package and deploy Back-end source code to AWS <br> - Configure environment variables and a secure Connection String from the server to RDS</td>
      <td class="col-date">06/25/2026</td>
      <td class="col-date">06/25/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">5</td>
      <td class="col-task">- Deploy the Front-end (host static files on S3 + CloudFront or AWS Amplify) <br> - Configure API paths from the Front-end to point to the correct Back-end address on AWS</td>
      <td class="col-date">06/26/2026</td>
      <td class="col-date">06/26/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">6</td>
      <td class="col-task">- Configure advanced authorization using IAM Roles, eliminating static Access Keys from source code <br> - Upload media (images, documents) to S3 Bucket and verify public/private access permissions</td>
      <td class="col-date">06/27/2026</td>
      <td class="col-date">06/27/2026</td>
      <td class="col-ref"></td>
    </tr>
    <tr>
      <td class="col-day">7</td>
      <td class="col-task">- Run a full End-to-End test of the application on the Cloud environment <br> - Ensure all AWS services work together seamlessly</td>
      <td class="col-date">06/28/2026</td>
      <td class="col-date">06/28/2026</td>
      <td class="col-ref"></td>
    </tr>
  </tbody>
</table>


### Week 10 Achievements:

* Successfully built a secure network and storage infrastructure on AWS for the graduation project.
* Synchronously deployed both Front-end and Back-end to the cloud, activating a fully managed cloud database.
* The system runs stably, with all components connected accurately and following account security principles.
