# AWS with Terraform - 30 Day Learning Journey

Welcome to my 30-day AWS and Terraform learning repository! This README will be updated daily as I progress through each day's learning objectives.

> **🔗 Connect with Me:** [![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/mohammad-adnan-m/) &nbsp; [![Blog](https://img.shields.io/badge/Blog-FF6B35?style=for-the-badge&logo=blogger&logoColor=white)](https://adnandevops.blogspot.com/) &nbsp; [![Portfolio](https://img.shields.io/badge/Portfolio-000000?style=for-the-badge&logo=github&logoColor=white)](https://mohammad-adnan-devops-5g34mr2.gamma.site/)

**Last Updated:** December 3, 2025

---

## 📊 Progress Summary

| Metric | Value |
|--------|-------|
| **Days Completed** | 10 |
| **Total Days** | 30 |
| **Completion Rate** | 33% |
| **Current Streak** | 10 Days ✅ |


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

### Day 06: File Structure & .gitignore
- **Status:** ✅ Completed
- **Files:** `Day-06/backend.tf`, `Day-06/main.tf`, `Day-06/providers.tf`, `Day-06/variables.tf`, `Day-06/locals.tf`, `Day-06/output.tf`, `Day-06/terraform.tfvars`
- **Other Changes:** Added `.gitignore` at repository root with entries to exclude local and sensitive files from version control
- **Key Learnings:**
  - Added `.gitignore` to the repository root to exclude local Terraform files and sensitive data (e.g., `.terraform/`, `*.tfstate`, `terraform.tfvars`), preventing accidental commits
  - Configured S3 backend in `Day-06/backend.tf` with server-side encryption and state locking to support safe collaboration
  - Standardized project file layout and validated the structure across days
  - Implemented consistent variables and locals for naming resources and improving reusability
  - Provisioned core resources (S3 bucket, VPC, EC2 instance) and exposed outputs (VPC ID, instance public IP) for downstream references

```text
# .gitignore snippet
.terraform*
*.tfstate
*.tfstate.*backup
.terraform.lock.hcl
crash.log
*.logs
terraform.tfvars
*.tfvars.json
.terraform/
```

---

### Day 07: EC2 Deployment, Security & Variable Validation
- **Status:** ✅ Completed
- **Files:** `Day-07/backend.tf`, `Day-07/main.tf`, `Day-07/providers.tf`, `Day-07/variables.tf`, `Day-07/locals.tf`, `Day-07/output.tf`, `Day-07/terraform.tfvars`
- **Key Learnings:**
  - Implemented parameterized EC2 deployment using the `var.config` object and `var.instance_count` for scaling instances
  - Constrained instance type and region selection using `allowed_instance_type` and `allowed_region`
  - Controlled public IP assignment using `var.associate_public_ip`, demonstrating network access control via variables
  - Implemented security group rules using `ingress_values` and `cidr_block` variables for flexible ingress/egress rules
  - Reused S3 backend with state locking for safe team collaboration (see `Day-07/backend.tf`)
  - Practiced using `count`, variable-driven tags and structured variables to maintain consistency

---

### Day 08: Terraform Meta-Arguments — depends_on, count & for_each
- **Status:** ✅ Completed
- **Files:** `Day-08/main.tf`, `Day-08/variables.tf`, `Day-08/backend.tf`, `Day-08/providers.tf`
- **Key Learnings:**
  - Understood Terraform **meta-arguments** that control resource behavior:
    - `depends_on` for explicit resource ordering and dependency resolution
    - `count` to quickly replicate resources using iterative numeric loops
    - `for_each` for dynamically provisioning resources using sets and maps
  - Demonstrated dependency flow control (VPC → SG → EC2) using `depends_on`
  - Created multiple S3 buckets via `count.index` using lists
  - Built dynamic bucket creation using `for_each` with environment-specific maps
  - Clarified limitations of `count` with sets and power of `for_each` for unique resource identities
  - Improved Terraform code quality by removing duplication and increasing scalability through iteration

---

### Day 09: Terraform Lifecycle Rules — create_before_destroy, prevent_destroy & ignore_changes
- **Status:** ✅ Completed
- **Files:** `Day-09/main.tf`, `Day-09/backend.tf`, `Day-09/providers.tf`, `Day-09/variables.tf`, `Day-09/output.tf`
- **Key Learnings:**
 - Learned how to use Terraform **lifecycle meta-arguments** to safely manage resource updates and replacements
 - Implemented `create_before_destroy` to avoid production downtime during updates
 - Used `prevent_destroy` to protect critical resources from accidental deletion (e.g., production buckets, VPCs)
 - Applied `ignore_changes` to skip unnecessary or unsafe updates such as AMI changes, IP changes, and tag drift
 - Understood real-world scenarios including safe deployment strategies, CI/CD drift handling & disaster prevention

---

#### Day 10: Conditional Expressions, Dynamic Blocks & Splat Expressions
- **Status:** ✅ Completed
- **Files:** `Day-10/main.tf`, `Day-10/variables.tf`, `Day-10/backend.tf`, `Day-10/providers.tf`, `Day-10/output.tf`
- **Key Learnings:**
- Used **conditional expressions** to select instance types dynamically based on environment
- Example: `instance_type = var.environment == "dev" ? "t2.micro" : "t3.micro"`
- Implemented `dynamic blocks` to generate multiple nested blocks for security group rules
reducing duplication and improving maintainability
- Applied splat expressions (`[*]`) to gather attributes from multiple EC2 instances created using count
- Structured nested objects in variables and iterated using `for_each` inside dynamic blocks
- Enhanced code reusability, readability and reduced repetitive blocks

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
├── Day-06/
│   ├── backend.tf
│   ├── main.tf
│   ├── providers.tf
│   ├── variables.tf
│   ├── locals.tf
│   ├── output.tf
│   └── terraform.tfvars
├── Day-07/
│   ├── backend.tf
│   ├── main.tf
│   ├── providers.tf
│   ├── variables.tf
│   ├── locals.tf
│   ├── output.tf
│   └── terraform.tfvars
├── Day-08/
│   ├── backend.tf
│   ├── main.tf
│   ├── providers.tf
│   ├── variables.tf
│   └── output.tf
├── Day-09/
│   ├── backend.tf
│   ├── main.tf
│   ├── providers.tf
│   ├── variables.tf
│   └── output.tf
└── Day-10/
    ├── backend.tf
    ├── main.tf
    ├── providers.tf
    ├── variables.tf
    └── output.tf
└── Day-11/ (Upcoming)
└── ... (Days 12-30)
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

**Updated:** December 3, 2025
**Progress:** 10/30 Days ✅
