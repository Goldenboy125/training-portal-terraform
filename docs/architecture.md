
# Training Portal – Actual Deployed Architecture

This diagram shows the AWS resources currently deployed through Terraform.

```mermaid
flowchart TB
    subgraph AWS["AWS Cloud - eu-north-1"]
        subgraph VPC["Training Portal VPC - 10.20.0.0/16"]
            IGW["Internet Gateway"]
            PUBRT["Public Route Table"]
            PRIVRT["Private Route Table"]
            P1["Public Subnet 1"]
            P2["Public Subnet 2"]
            S1["Private Subnet 1"]
            S2["Private Subnet 2"]

            IGW --> PUBRT
            PUBRT --> P1
            PUBRT --> P2
            PRIVRT --> S1
            PRIVRT --> S2
        end

        subgraph STORAGE["Amazon S3 - Regional Service"]
            BUCKET["Private Training Documents Bucket"]
            ENC["AES-256 Encryption"]
            VER["Versioning Enabled"]
            BLOCK["Block Public Access"]

            BUCKET --> ENC
            BUCKET --> VER
            BUCKET --> BLOCK
        end

        subgraph IAM["AWS Identity and Access Management"]
            APP["Application IAM Role"]
            POLICY["Restricted S3 Access Policy"]
            EXEC["ECS Execution IAM Role"]

            APP --> POLICY
            POLICY --> BUCKET
        end
    end
```

**Important notes:**
- The private subnets have no NAT Gateway or default internet route.
- The S3 bucket is private, encrypted and versioned.
- The application IAM role and S3 policy exist, but no running application currently uses them.
- The ECS execution role is left over from an earlier experiment.
- A live website, database and monitoring alarms have not yet been deployed.
