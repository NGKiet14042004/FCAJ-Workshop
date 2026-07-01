---
title: "Week 7 Worklog"
date: 2026-01-01
weight: 7
chapter: false
pre: " <b> 1.7. </b> "
---

### Week 7 Objectives:

* Research the Amazon Relational Database Service (Amazon RDS) managed database service.
* Study storage options, security, High Availability (Multi-AZ), and backup/recovery mechanisms.
* Practice connecting an EC2 server to an RDS database and deploying a real-world application.

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
      <td class="col-task">- Study Amazon RDS overview: Managed Service benefits (automatic backup, patching, easy scaling) <br> - Differentiate supported Database Engines (Aurora, MySQL, PostgreSQL, SQL Server...)</td>
      <td class="col-date">06/01/2026</td>
      <td class="col-date">06/01/2026</td>
      <td class="col-ref">https://000005.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">2</td>
      <td class="col-task">- Research storage options: General Purpose SSD (gp2/gp3) and Provisioned IOPS SSD (io1/io2) <br> - Study High Availability through Multi-AZ (auto-failover in 60-120s) and Read Replicas</td>
      <td class="col-date">06/02/2026</td>
      <td class="col-date">06/02/2026</td>
      <td class="col-ref">https://000005.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">3</td>
      <td class="col-task">- Study RDS security: AWS KMS encryption, VPC network isolation, IAM authorization, SSL/TLS <br> - Study backup mechanisms: Automated Backups (up to 35 days) and Manual Snapshots</td>
      <td class="col-date">06/03/2026</td>
      <td class="col-date">06/03/2026</td>
      <td class="col-ref">https://000005.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">4</td>
      <td class="col-task">- Set up prerequisite infrastructure: create a VPC, EC2 Security Group, RDS Security Group, and DB Subnet Group</td>
      <td class="col-date">06/04/2026</td>
      <td class="col-date">06/04/2026</td>
      <td class="col-ref">https://000005.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">5</td>
      <td class="col-task">- Practice launching an Amazon EC2 Instance as an Application Server <br> - Practice creating an RDS Database Instance (select Engine, configure Storage and network)</td>
      <td class="col-date">06/05/2026</td>
      <td class="col-date">06/05/2026</td>
      <td class="col-ref">https://000005.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">6</td>
      <td class="col-task">- Deploy application: configure EC2-to-RDS connection; run basic SQL queries <br> - Practice RDS Backup and Restore procedures</td>
      <td class="col-date">06/06/2026</td>
      <td class="col-date">06/06/2026</td>
      <td class="col-ref">https://000005.awsstudygroup.com</td>
    </tr>
    <tr>
      <td class="col-day">7</td>
      <td class="col-task">- Clean up resources: delete the RDS DB Instance, EC2 Instance, and related network configurations <br> - Prevent unexpected costs on the Free Tier account</td>
      <td class="col-date">06/07/2026</td>
      <td class="col-date">06/07/2026</td>
      <td class="col-ref">https://000005.awsstudygroup.com</td>
    </tr>
  </tbody>
</table>


### Week 7 Achievements:

* Clearly understood the operating principles, security architecture, and High Availability solutions (Multi-AZ, Read Replicas) of Amazon RDS.
* Proficient in configuring the network environment (Subnet Group, Security Group) to isolate and protect the database.
* Successfully deployed the EC2-to-RDS connection, ensuring data integrity and security.
* Mastered the snapshot backup and proper DB infrastructure cleanup process to control cloud costs.
