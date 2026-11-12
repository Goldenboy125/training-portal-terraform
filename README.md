# AWS Training Portal Infrastructure

A cost-conscious AWS infrastructure project built with Terraform.

## Project Overview

This project demonstrates how to design secure cloud infrastructure
for an online training portal supporting approximately 100 registered users
and 20 concurrent users.

## Project Goals

- Host a public website securely over HTTPS.
- Protect participant records and uploaded documents.
- Restrict administrative access.
- Plan for backup and disaster recovery.
- Monitor infrastructure and control AWS costs.

## Technology

- Amazon Web Services (AWS)
- Terraform
- Linux / Ubuntu
- AWS CLI
- Git and GitHub

## Deployment Region

eu-north-1 (Europe - Stockholm)

## Project Status

### Completed
- Terraform project initialized and validated.
- AWS VPC created in eu-north-1.
- Two public subnets deployed across two Availability Zones.
- Two private subnets deployed across two Availability Zones.
- Internet Gateway configured.
- Public and private route tables configured.

### In Progress
- Secure S3 document storage.
- Application hosting.
- Database infrastructure.
- Monitoring, backups and disaster recovery.

## Cost and Security

This project uses a cost-conscious learning approach.
AWS resources will be reviewed before deployment to avoid unnecessary charges.
