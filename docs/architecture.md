
# AWS Training Portal Architecture

## Architecture Diagram

```mermaid
flowchart TB
    U[Participants and Administrators]

    subgraph AWS["AWS Cloud - eu-north-1"]
        subgraph PUBLIC["Public Website - Proposed"]
            CF[Amazon CloudFront - HTTPS]
            WEB[Amazon S3 - Website Hosting]
            U --> CF
            CF --> WEB
        end

        subgraph NETWORK["VPC - 10.20.0.0/16 - Deployed"]
            IGW[Internet Gateway]
            subgraph PUB["Public Subnets - Deployed"]
                P1[Public Subnet AZ 1]
                P2[Public Subnet AZ 2]
            end
            subgraph PRIV["Private Subnets - Deployed"]
                S1[Private Subnet AZ 1]
                S2[Private Subnet AZ 2]
            end
            IGW --> P1
            IGW --> P2
        end

        subgraph SECURITY["Storage and Access - Deployed"]
            IAM[AWS IAM Roles and Policies]
            DOC[Private Amazon S3 Document Bucket]
        end

        subgraph FUTURE["Future Application Components"]
            APP[Application and Authentication]
            DB[(Participant Database)]
            CW[CloudWatch Monitoring and Alarms]
            BK[Backup and Recovery]
        end

        WEB -.-> APP
        APP --> DB
        APP --> DOC
        IAM --> DOC
        APP -.-> CW
        DB -.-> BK
        DOC -.-> BK
    end

    classDef deployed fill:#d8f3dc,stroke:#287a45,color:#123;
    classDef planned fill:#fff0cc,stroke:#b8860b,color:#432;
    class VPC,IGW,P1,P2,S1,S2,IAM,DOC deployed;
    class CF,WEB,APP,DB,CW,BK planned;
```

## Diagram Legend

- Green: Infrastructure already deployed through Terraform.
- Yellow: Proposed components not yet deployed.
- Solid arrows: Intended connections or access relationships.
- Dashed arrows: Planned integrations.

## Deployed Infrastructure

- One VPC with CIDR `10.20.0.0/16`.
- Two public subnets and two private subnets.
- Internet Gateway and route tables.
- Private S3 document bucket with encryption and versioning.
- IAM roles and restricted document access policies.

## Proposed Infrastructure

- CloudFront for public HTTPS delivery.
- S3 static website hosting.
- Application and authentication layer.
- Participant database.
- CloudWatch monitoring and alarms.
- Backup and disaster recovery implementation.

**Important:** The proposed components are part of the target architecture, not currently deployed AWS resources.
