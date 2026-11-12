# AWS Training Portal Infrastructure

## Project Overview

This project demonstrates the design and partial implementation of a cost-conscious AWS infrastructure for an online training portal supporting approximately 100 registered users and 20 concurrent users.

The project uses Terraform to provision AWS networking, private document storage and identity and access management resources.

## Project Requirements

- Public website accessible over HTTPS.
- Secure participant records and uploaded documents.
- Restricted administrative access.
- Recovery Point Objective (RPO): 1 hour.
- Recovery Time Objective (RTO): 4 hours.
- Monitoring, backup and cost management.
- Infrastructure documentation and architecture diagram.

## Technology Stack

- Amazon Web Services (AWS)
- Terraform
- Amazon VPC
- Amazon S3
- AWS IAM
- AWS CLI
- Ubuntu Linux
- Git and GitHub

## Deployment Region

`eu-north-1` — Europe (Stockholm)

## Implemented Infrastructure

### Networking

- VPC with CIDR block `10.20.0.0/16`.
- Two public subnets across two Availability Zones.
- Two private subnets across two Availability Zones.
- Internet Gateway.
- Public and private route tables.
- Private subnets have no direct internet route or NAT Gateway.

### Private Document Storage

- Amazon S3 document bucket.
- S3 Block Public Access enabled.
- Server-side encryption using AES-256.
- Bucket versioning enabled.
- Bucket ownership controls configured.
- Lifecycle management for noncurrent object versions and incomplete multipart uploads.

### Identity and Access Management

- Application IAM role.
- Restricted S3 document access permissions.
- Separate execution-role resources were created during an earlier ECS experiment; they are not part of the intended final architecture.

## Proposed Architecture

The intended architecture uses:

- Amazon CloudFront for HTTPS delivery of a public website.
- Amazon S3 for static website assets.
- A private application layer for participant operations.
- A database for participant records.
- A private S3 bucket for uploaded documents.
- IAM policies for access control.
- CloudWatch for monitoring and alerting.

These proposed components have not been deployed in this implementation.

## Security

Implemented controls:

- Private S3 bucket.
- Public access blocking.
- AES-256 encryption at rest.
- S3 versioning.
- Restricted application S3 permissions.
- Network separation using public and private subnets.

Further controls required:

- User authentication and administrator access restrictions.
- HTTPS configuration.
- Database encryption and access restrictions.
- Secrets management.
- Monitoring and security alerts.

## Backup and Disaster Recovery

The project targets:

- RPO: 1 hour.
- RTO: 4 hours.

S3 versioning and lifecycle management have been configured for document protection.

However, a complete hourly database recovery strategy and a tested four-hour recovery procedure have not yet been implemented. These remain requirements for a future deployment.

## Monitoring and Alerting

The following five monitoring alerts are proposed:

1. High application CPU utilization.
2. High database CPU utilization.
3. Low database storage capacity.
4. Application availability or HTTP health-check failure.
5. Unusual S3 access or failed application requests.

These are design recommendations, not deployed CloudWatch alarms.

## Cost Management

The implementation uses a cost-conscious approach:

- Avoid unnecessary NAT Gateways.
- Use private S3 storage.
- Apply S3 lifecycle policies.
- Avoid continuously running compute resources when not needed.
- Review AWS pricing before deploying managed databases, load balancers or monitoring services.
- Destroy learning infrastructure after collecting project evidence.

## Limitations and Future Improvements

The current implementation provides foundational networking, storage and IAM resources.

It does not yet provide a functioning authenticated training portal, participant database, public HTTPS endpoint, deployed monitoring alarms or tested disaster recovery.

Future improvements include:

- Deploying a static website through CloudFront and S3.
- Implementing authentication and administrator access.
- Adding a managed participant database.
- Configuring CloudWatch alarms.
- Implementing and testing backup and recovery procedures.
- Completing a detailed cost estimate.

## Repository

[GitHub - AWS Training Portal Infrastructure](https://github.com/Goldenboy125/training-portal-terraform)

## Disclaimer

This is a cloud engineering learning and portfolio project. The implemented infrastructure should not be considered production-ready. The proposed components and recovery objectives require further implementation and testing.
