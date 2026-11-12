
# Training Portal – AWS Cost Estimate

## 1. Deployment assumptions

- AWS Region: Europe (Stockholm), eu-north-1
- Registered users: approximately 100
- Expected concurrent users: approximately 20
- Pricing model: AWS On-Demand and pay-as-you-go
- Estimate period: 730 hours per month
- Currency: USD
- Taxes and currency conversion are excluded.

## 2. Current deployed infrastructure

| AWS resource | Current usage | Cost consideration |
|---|---|---|
| Amazon VPC | One VPC | No direct hourly charge |
| Public and private subnets | Four subnets | No direct hourly charge |
| Internet Gateway | One | No direct hourly charge |
| Route tables | Two | No direct hourly charge |
| Amazon S3 | Empty private bucket | Storage and request charges; currently no stored objects |
| AWS IAM | Two roles and policies | No additional IAM service charge |
| NAT Gateway | Not deployed | No NAT hourly or processing charge |
| EC2 / ECS / RDS | Not deployed | No compute or database charges from this project |

The current infrastructure has a low direct running cost. The S3 bucket is empty, and the network and IAM resources listed above do not have direct hourly charges. Actual billing should still be checked in AWS Billing.

## 3. Proposed full portal cost worksheet

The following services are design recommendations, not deployed resources.

| Proposed service | Pricing unit / cost driver | Estimate method |
|---|---|---|
| Application compute (EC2) | Instance hours and EBS storage | Instance hourly rate × 730 hours, plus storage |
| Database (Amazon RDS) | Database instance hours, storage and backups | Selected instance rate × 730 hours, plus storage |
| Document storage (S3) | GB stored, requests and data transfer | Monthly GB × regional storage rate, plus requests |
| HTTPS delivery | CloudFront requests and data transfer | Estimate expected monthly traffic |
| Monitoring (CloudWatch) | Alarms, metrics and log ingestion | Number of alarms and GB of logs |
| Domain name (optional) | Annual domain registration | Check registrar and Route 53 pricing |
| NAT Gateway | Hourly usage and data processed | Not included in the proposed low-cost baseline |

Exact prices must be selected for eu-north-1 using the AWS Pricing Calculator before deployment.

## 4. Cost controls

1. Avoid NAT Gateway charges unless private outbound internet access is genuinely required.
2. Set AWS Budgets alerts and review monthly spending.
3. Use S3 lifecycle policies to expire old document versions and remove incomplete multipart uploads.
4. Use small, right-sized compute and database instances, and scale only when monitoring shows a need.
5. Delete unused test resources after completing practical exercises.

## 5. Important limitations

- This is a planning worksheet, not a guaranteed AWS quotation.
- The proposed application, database, HTTPS delivery and monitoring services have not been deployed.
- Actual charges depend on traffic, storage, requests, region, data transfer and selected service configurations.
- Free Tier eligibility and credits depend on the AWS account and applicable terms.

## 6. Official pricing references

- AWS Pricing Calculator: https://calculator.aws/
- Amazon EC2 pricing: https://aws.amazon.com/ec2/pricing/
- Amazon S3 pricing: https://aws.amazon.com/s3/pricing/
- Amazon RDS pricing: https://aws.amazon.com/rds/pricing/
- Amazon CloudWatch pricing: https://aws.amazon.com/cloudwatch/pricing/
