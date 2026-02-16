# ⚙️ Terraform AWS EC2 Infrastructure

Terraform configuration to provision an AWS EC2 instance along with supporting network resources such as VPC, subnets, route tables, and security groups.
This repository enables you to deploy an EC2 server in AWS using Infrastructure as Code (IaC), making your cloud setup repeatable, versioned, and automated.
GitHub

# 🧠 About

This repository uses Terraform to define and provision:

AWS VPC, subnets, and routing resources

Security group for controlled network access

EC2 instance with user data for initialization

The configuration ensures that you can deploy a fully configured EC2 instance within a secure network environment using IaC principles.
GitHub

# 🛠️ Prerequisites

✔ Terraform CLI installed (v1.x or later)
✔ AWS account with permission to create VPC, EC2, and networking resources
✔ AWS credentials configured locally
✔ Basic understanding of Terraform and AWS networking

# 🚀 Usage
### 1. Clone the Repository
git clone https://github.com/RajGitUser/EC2.git
cd EC2

### 2. Initialize Terraform
terraform init


This sets up the Terraform working directory and downloads provider plugins.

### 3. Review the Plan
terraform plan -var-file="terraform.tfvars"


Inspect the changes that Terraform will apply before provisioning.

### 4. Apply the Configuration
terraform apply -var-file="terraform.tfvars"


Confirm to provision the infrastructure in your AWS account.

### 5. Destroy Resources
terraform destroy -var-file="terraform.tfvars"


Use this command to remove all infrastructure created by Terraform.

# ⚙️ Terraform Workflow

Terraform uses a declarative workflow:

Write infrastructure definitions in .tf files

Initialize the directory with provider plugins

Plan to preview resource creation

Apply to provision resources

Destroy to tear down when no longer needed

This ensures clear and predictable infrastructure changes.

# 📤 Outputs

Upon Apply, Terraform may output:

EC2 instance ID

Public IP

VPC ID

Subnet IDs

These outputs help you reference infrastructure details for further automation or configuration.

# 📈 Best Practices

✔ Use a remote backend (e.g., AWS S3 + DynamoDB) for shared state
✔ Parameterize sensitive values using variables
✔ Use environment-specific tfvars files
✔ Tag resources consistently for cost and operational tracking

# 🤝 Contributing

Contributions are welcome! You can:

Add examples for different AWS regions

Integrate IAM roles and advanced security

Add modules for reusable components

Fork the repository

Create a feature branch

Open a Pull Request
