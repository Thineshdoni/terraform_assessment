🏗 Architecture

This project provisions a production-standard AWS infrastructure using Terraform.

High-Level Architecture

A custom VPC with public and private subnets

Public Subnet

Frontend EC2 instance

Backend EC2 instance

Connected to the internet via Internet Gateway

Private Subnet (Database)

Database EC2 instance

No public IP

Private Subnet (Monitoring & Observability)

Monitoring EC2 instance

No public IP

NAT Gateway

Enables outbound internet access for private instances

Security Groups

Enforce least-privilege access between tiers

Network Flow

Internet → Internet Gateway → Public Subnet

Private subnets → NAT Gateway → Internet

Frontend/Backend → Database

Monitoring → All instances

📁 Module Structure

The Terraform configuration is organized into reusable modules:

- `modules/vpc/`: VPC, subnets, internet gateway, NAT gateway, route tables
- `modules/security_groups/`: Security groups for public and private instances
- `modules/ec2/`: EC2 instances for frontend, backend, database, and monitoring

The root `main.tf` calls these modules to provision the infrastructure.

▶️ How to Run terraform init

Initializes the Terraform working directory and downloads the required provider plugins and backend configuration.

terraform init


What this does:

Configures the S3 remote backend

Initializes provider plugins

Prepares Terraform for execution

▶️ How to Run terraform plan

Generates and shows an execution plan without making any changes.

terraform plan


What this does:

Compares desired infrastructure with current state

Shows resources to be created, modified, or destroyed

Helps validate configuration before applying

▶️ How to Run terraform apply

Applies the Terraform configuration and creates AWS resources.

terraform apply


What this does:

Provisions VPC, subnets, gateways, EC2 instances

Prompts for confirmation before execution

Displays outputs (e.g., public IPs) after completion

To skip confirmation:

terraform apply -auto-approve

✅ Result

After successful execution:

Public EC2 instances are accessible via the internet

Private EC2 instances have outbound internet access only

Infrastructure is fully provisioned without errors
