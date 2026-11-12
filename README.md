# AWS Training Portal Infrastructure

A cost-conscious AWS infrastructure project built with Terraform to demonstrate secure, scalable cloud infrastructure for an online training portal.

## Project Overview

This project demonstrates how to design and deploy AWS infrastructure for an online training portal supporting approximately 100 registered users and 20 concurrent users.

The infrastructure is designed with security, availability, backup and disaster recovery, monitoring, and cost management in mind.

## Project Goals

- Host a public website securely over HTTPS.
- Protect participant records and uploaded documents.
- Restrict application and administrative access.
- Design backup and disaster recovery capabilities.
- Monitor infrastructure and manage AWS costs.

## Technology Stack

- Amazon Web Services (AWS)
- Terraform (Infrastructure as Code)
- Amazon VPC
- Amazon S3
- AWS IAM
- Amazon ECS / AWS Fargate (planned)
- Linux / Ubuntu
- AWS CLI
- Git and GitHub

## Deployment Region

`eu-north-1` — Europe (Stockholm)

## Architecture Components

### Completed

**Networking**
- AWS VPC created with CIDR `10.20.0.0/16`.
- Two public subnets across two Availability Zones.
- Two private subnets across two Availability Zones.
- Internet Gateway configured.
- Public and private route tables configured.

**Private Document Storage**
- Amazon S3 document bucket deployed.
- S3 Block Public Access enabled.
- Server-side encryption using SSE-S3 (AES-256).
- S3 versioning enabled.
- Bucket ownership controls configured.
- Lifecycle rule for noncurrent object versions and incomplete multipart uploads.

**Identity and Access Management**
- Application ECS task role created.
- Least-privilege S3 permissions configured for the application.
- Separate ECS execution role created.
- `AmazonECSTaskExecutionRolePolicy` attached to the execution role.

### In Progress

- Containerized application development.
- Amazon ECS with AWS Fargate.
- Application Load Balancer and HTTPS configuration.
- Database infrastructure.
- Monitoring and alerting.
- Backup and disaster recovery implementation.
- Architecture diagram and cost estimation.

## Security Approach

- Private S3 document storage.
- IAM roles for application and ECS execution permissions.
- Least-privilege access to training documents.
- Encryption at rest.
- Network separation using public and private subnets.
- Terraform-managed infrastructure.

## Cost Management

This project follows a cost-conscious learning approach.

AWS resources are reviewed before deployment to avoid unnecessary charges. Services with ongoing costs, including load balancers, compute, databases, NAT gateways and data transfer, will be evaluated before implementation.

## Project Status

The foundational networking, private document storage and IAM components have been deployed and verified.

Application hosting, database, monitoring, backup and recovery components remain under development.

## Repository

[GitHub - AWS Training Portal Infrastructure](https://github.com/Goldenboy125/training-portal-terraform)

## Disclaimer

This is a practical cloud engineering learning and portfolio project. Production readiness, backup recovery objectives and security controls will require further implementation and testing.
