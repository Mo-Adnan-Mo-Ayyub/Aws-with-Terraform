# AWS with Terraform - 30 Day Learning Journey

Welcome to my 30-day AWS and Terraform learning repository! This README will be updated daily as I progress through each day's learning objectives.

> **🔗 Connect with Me:** [![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/mohammad-adnan-m/) &nbsp; [![Blog](https://img.shields.io/badge/Blog-FF6B35?style=for-the-badge&logo=blogger&logoColor=white)](https://adnandevops.blogspot.com/) &nbsp; [![Portfolio](https://img.shields.io/badge/Portfolio-000000?style=for-the-badge&logo=github&logoColor=white)](https://mohammad-adnan-devops-5g34mr2.gamma.site/)

**Last Updated:** November 28, 2025

---

## 📊 Progress Summary

| Metric | Value |
|--------|-------|
| **Days Completed** | 5 |
| **Total Days** | 30 |
| **Completion Rate** | 16.67% |
| **Current Streak** | 5 Days ✅ |

---

## ✅ Completed Days

### Day 01: Terraform Setup & Installation
- **Status:** ✅ Completed
- **File:** `Day-01/terraform-setup.md`
- **Key Learnings:**
  - Installed Terraform on local machine
  - Set up AWS CLI configuration
  - Initialized first Terraform project
  - Understood basic Terraform concepts and HCL syntax

---

### Day 02: Basic Terraform Configuration  
- **Status:** ✅ Completed
- **File:** `Day-02/main.tf`
- **Key Learnings:**
  - Created first `main.tf` with provider configuration
  - Learned about AWS provider setup
  - Understanding of resource declarations
  - Basic variable usage in Terraform

---

### Day 03: AWS Resources (S3 & VPC)
- **Status:** ✅ Completed
- **Files:** `Day-03/main.tf`, `Day-03/s3.tf`, `Day-03/vpc.tf`
- **Key Learnings:**
  - Created S3 bucket with Terraform
  - Configured VPC with subnets
  - Managed security groups for resources
  - Understood AWS networking basics

---

### Day 04: State Management & Providers
- **Status:** ✅ Completed
- **Files:** `Day-04/main.tf`, `Day-04/providers.tf`, `Day-04/state-backend.tf`
- **Key Learnings:**
  - Configured AWS provider with regions
  - Set up remote state backend
  - Understood Terraform state files
  - Best practices for state management

---

### Day 05: S3, VPC & EC2 Instance
- **Status:** ✅ Completed
- **Files:** `Day-05/main.tf`, `Day-05/providers.tf`, `Day-05/input.tf`, `Day-05/locals.tf`, `Day-05/output.tf`, `Day-05/terraform.tfvars`
- **Key Learnings:**
  - Provisioned S3 bucket with Terraform and used `locals` for naming and tagging
  - Created a VPC resource and tagged resources for environment identification
  - Launched EC2 instance using dynamic AMI resolution (SSM) and variable-driven instance type
  - Implemented variables, locals and outputs for better parameterization and reusability
  - Exposed outputs such as VPC ID and EC2 public IP for future integrations

---

## 📁 Project Structure

```text
Terraform/
├── README.md
├── Day-01/
│   └── terraform-setup.md
├── Day-02/
│   └── main.tf
├── Day-03/
│   ├── main.tf
│   ├── s3.tf
│   └── vpc.tf
├── Day-04/
│   ├── main.tf
│   ├── providers.tf
│   └── state-backend.tf
├── Day-05/
│   ├── main.tf
│   ├── providers.tf
│   ├── input.tf
│   ├── locals.tf
│   ├── output.tf
│   └── terraform.tfvars
├── Day-06/ (Upcoming)
├── Day-07/ (Upcoming)
├── Day-08/ (Upcoming)
└── ... (Days 09-30)
```

---

## 🎯 Learning Path Overview

### **Week 1: Foundations (Days 1-7)**
- Setting up Terraform environment
- Basic configuration and providers
- Core AWS services (S3, VPC, EC2)
- Networking and load balancing
- Database services

### **Week 2: Advanced Services (Days 8-14)**
- Identity and access management
- Serverless computing
- APIs and messaging
- NoSQL databases
- CDN and content delivery

### **Week 3: Infrastructure Patterns (Days 15-21)**
- DNS management
- Infrastructure as code patterns
- Workspaces and state management
- CI/CD pipelines
- Testing and validation

### **Week 4: Production & Optimization (Days 22-30)**
- Best practices
- Multi-region deployments
- Auto-scaling
- Container services
- Cost optimization and disaster recovery

---

## 🚀 How to Use This Repository

### Prerequisites
- Terraform >= 1.0
- AWS Account with CLI configured
- Basic understanding of cloud infrastructure

### Getting Started

```bash
# Clone the repository
git clone https://github.com/Mo-Adnan-Mo-Ayyub/Aws-with-Terraform.git
cd Terraform

# Navigate to a completed day
cd Day-01

# Initialize Terraform
terraform init

# Plan your changes
terraform plan

# Apply configuration
terraform apply
```

---

## 💡 Tips & Best Practices

1. ✅ Always run `terraform plan` before `terraform apply`
2. ✅ Commit `.tf` files to git, and use a `.gitignore` file to exclude `*.tfstate`, `*.tfstate.backup`, and related state files from version control
3. ✅ Use meaningful variable names and comments
4. ✅ Keep sensitive data in `.tfvars` or AWS Secrets Manager
5. ✅ Test configurations in dev environment first
6. ✅ Document your infrastructure decisions

---

## 📚 Resources

- [Terraform Docs](https://www.terraform.io/docs)
- [AWS Terraform Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS Documentation](https://docs.aws.amazon.com/)

---

**Updated:** November 28, 2025
**Progress:** 5/30 Days ✅
