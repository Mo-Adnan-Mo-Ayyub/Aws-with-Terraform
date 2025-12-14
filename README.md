# AWS with Terraform - 30 Day Learning Journey

Welcome to my 30-day AWS and Terraform learning repository! This README will be updated daily as I progress through each day's learning objectives.

> **🔗 Connect with Me:** [![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/mohammad-adnan-m/) &nbsp; [![Blog](https://img.shields.io/badge/Blog-FF6B35?style=for-the-badge&logo=blogger&logoColor=white)](https://adnandevops.blogspot.com/) &nbsp; [![Portfolio](https://img.shields.io/badge/Portfolio-000000?style=for-the-badge&logo=github&logoColor=white)](https://mohammad-adnan-devops-5g34mr2.gamma.site/)

**Last Updated:** December 14, 2025

---

## 📊 Progress Summary

| Metric | Value |
|--------|-------|
| **Days Completed** | 18|
| **Total Days** | 30 |
| **Completion Rate** | 60% |
| **Current Streak** | 18 Days ✅ |


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

### **Day 11: Terraform Built-in Functions (Part 1)**
- **Status:** ✅ Completed  
- **Files:** `Day-11/main.tf`, `Day-11/output.tf`, `Day-11/locals.tf`, `Day-11/terraform.tfvars`
- **Key Learnings:**
  - Understood the importance of Terraform **built-in functions** for transformation, validation and reusable compositions
  - Used chaining of functions to sanitize resource names such as S3 bucket names:
    ```
    formatted_bucket_name = replace(replace(substr(lower(var.bucket_name), 0, 63), " ", "-"), "!", "")
    ```
  - Used `split()` and **for expressions** to transform strings into structured list objects
  - Applied `lookup()` for environment-based configuration with default fallback value
  - Validated expressions using `terraform console` for faster testing & debugging
- **Output Example:**  
Generated dynamic security group rule list:
```hcl
[for p in local.port_list : { name = "port-${p}", port = p, description = "allow traffic on port ${p}" }]
```
---

### **Day 12: Terraform Built-in Functions (Part 2)**
- **Status:** ✅ Completed
- **Files:** `Day-12/main.tf`, `Day-12/variables.tf`, `Day-12/locals.tf`, `Day-12/output.tf`, `Day-12/terraform.tfvars`
- **Key Learnings:**
  - Implemented **validation functions** using `length()`, `regex()`, and `endswith()` to ensure correct variable formatting and prevent invalid input errors
  - Used **sensitive = true** to secure secrets and protect value exposure in console outputs
  - Performed **type conversion** using `concat()` and `toset()` to merge lists and automatically remove duplicates for clean configuration inputs
  - Applied **numeric functions** such as `abs()`, `sum()`, and `max()/min()` for real-world cost evaluation and aggregated metrics
  - Leveraged **timestamp()** and **formatdate()** for dynamic resource naming and versioned backups like `backup-2025-12-06`
  - Practiced file handling using `fileexists()`, `file()`, and `jsondecode()` to load optional config JSON safely with conditional expressions

---

### Day 13: Terraform Data Sources — Use Existing VPCs, Subnets & AMIs Safely
- **Status:** ✅ Completed
- **Files:** `Day-13/main.tf`, `Day-13/datasource.tf`, `Day-13/variables.tf`, `Day-13/output.tf`, `Day-13/terraform.tfvars`
**Key Learnings:**
- Understood what **Terraform Data Sources** are and why they are essential for referencing **existing** AWS resources
- Learned to use `data "aws_vpc"`, `data "aws_subnet"`, and `data "aws_ami"` to fetch real AWS resource IDs
- Avoided **hardcoding VPC IDs, Subnet IDs & AMI IDs**, improving automation and repeatability
- Used `filters`, `owners`, and `most_recent` to dynamically select resources
- Implemented real-world EC2 deployment using dynamic AMI discovery and existing network resources
- Verified configuration using `terraform plan` and observed Terraform using referenced resource values instead of creating new infrastructure

---

### Day 14: Host Static Website on AWS S3 + CloudFront + Route 53 using Terraform
- **Status:** ✅ Completed
- **Files:**  
  `Day-14/backend.tf`, `Day-14/datasource.tf`, `Day-14/main.tf`, `Day-14/providers.tf`, `Day-14/variables.tf`, `Day-14/locals.tf`, `Day-14/output.tf`, `Day-14/terraform.tfvars`, `Day-14/www/` *(HTML, CSS, JS files for deployment)*

- **Key Learnings:**
  - Hosted a **fully private S3 bucket** configured for static website storage
  - Implemented **CloudFront distribution** with edge caching for performance & global CDN delivery
  - Configured **Origin Access Control (OAC)** so CloudFront is the only entity allowed to access bucket objects
  - Attached **Bucket Policy** granting restricted read access using `aws:SourceArn`
  - Used `fileset()` + `for_each` + `filemd5()` to upload multiple static assets dynamically from local `www` folder
  - Added **Route 53 DNS records** with alias mapping to CloudFront for custom domain support
  - Attached **ACM SSL Certificate** for HTTPS (in `us-east-1` mandatory for CloudFront)
  - Learned cache management, invalidation, and TTL-based optimizations

---

### Day 15: AWS VPC Peering Across Regions Using Terraform
- **Status:** ✅ Completed
- **Files:** `Day-15/backend.tf`, `Day-15/main.tf`, `Day-15/providers.tf`, `Day-15/variables.tf`, `Day-15/locals.tf`, `Day-15/data.tf`

- **Key Learnings:**
  - Created **multi-region VPCs** using provider aliases *(us-east-1 & us-west-2)*
  - Built independent networking: subnets, internet gateways, route tables & associations for both VPCs
  - Used **data sources** to fetch region-specific AMIs & availability zones dynamically
  - Launched **EC2 instances with Nginx user-data** for testing connectivity using `curl private-ip` across VPCs
  - Implemented **bi-directional VPC peering** with requester & accepter configuration and routing updates
  - Configured route tables to route **10.0.0.0/16 ↔ 10.1.0.0/16** traffic over **VPC peering** instead of IGW
  - Added security rules for **SSH, ICMP (ping), and web access**
  - Ensured **DNS Hostnames & DNS Support** enabled for private DNS resolution
  - Verified connectivity using ping & curl across private IPs
  - Cleaned up resources using `terraform destroy` to avoid AWS billing

---

### Day 16: AWS IAM User Management with Terraform (CSV-Driven Automation)
- **Status:** ✅ Completed  
- **Files:**  
  `Day-16/backend.tf`, `Day-16/data.tf`, `Day-16/groups.tf`, `Day-16/locals.tf`, `Day-16/main.tf`, `Day-16/mfa.tf`, `Day-16/providers.tf`, `Day-16/output.tf`, `Day-16/variables.tf`, `Day-16/users.csv`

- **Key Learnings:**
  - Loaded a **CSV file** using `csvdecode()` to automate bulk IAM user creation
  - Generated **dynamic IAM usernames** using Terraform string functions (`lower`, `replace`, substrings)
  - Created **IAM users** using `for_each`, using fields like first name, last name, department, job title, email, phone, emp_id, location
  - Provisioned **console access** with `aws_iam_user_login_profile` and enforced **password reset on first login**
  - Implemented **IAM groups** (department-based, role-based) and **dynamic group membership** using filters + conditionals
  - Added **custom IAM policies** and attached them to groups to enforce least-privilege access
  - Enabled **MFA requirement** for IAM users via Terraform to strengthen login security
  - Used `can()` and conditional logic to avoid failures when CSV fields are missing or optional
  - Stored Terraform state in **S3 backend** with **DynamoDB locking** for safe team collaboration
  - Designed onboarding to be **CSV-driven**, making user creation, updates, and permissions version-controlled

---

### Day 17: Blue-Green Deployment on AWS Elastic Beanstalk with Terraform  
**Status:** ✅ Completed  
**Files:**  
`backend.tf`, `main.tf`, `blue_environment.tf`, `green_environment.tf`,  
`app_versions/`, `package_apps.sh / .ps1`, `variables.tf`, `outputs.tf`, `providers.tf`

### Key Learnings:
- Implemented **Blue-Green deployment** using Terraform + Elastic Beanstalk  
- Packaged app versions (v1 & v2) and uploaded to **private S3 bucket**  
- Created two identical environments: **Blue (live)** & **Green (staging)**  
- Deployed v1 → Blue, v2 → Green and tested before promoting  
- Performed **CNAME swap** to shift traffic with **zero downtime**  
- Learned quick **rollback** by swapping back to the old environment  
- Configured EB settings: IAM roles, autoscaling, health checks, env vars  
- Validated both environments using their CNAME URLs  
- Practiced a full cycle: package → deploy → test → swap → rollback

---

### Day 18: Serverless Image Processing using AWS Lambda with Terraform  
**Status:** ✅ Completed  
**Files:**  
`backend.tf`, `main.tf`, `iam.tf`, `lambda.tf`, `layer.tf`, `s3.tf`,  
`s3_notifications.tf`, `variables.tf`, `outputs.tf`,  
`scripts/build_layer.sh`, `scripts/deploy.sh`, `scripts/destroy.sh`

### Key Learnings:
- Built a **fully serverless, event-driven image processing pipeline** on AWS  
- Used **S3 event notifications** to trigger Lambda on image uploads  
- Packaged **Pillow** as a **Lambda Layer** for clean dependency management  
- Generated multiple image variants (JPEG, WebP, PNG, thumbnail) automatically  
- Applied **least-privilege IAM policies** for Lambda S3 and CloudWatch access  
- Enabled **S3 encryption, versioning, and public access blocking**  
- Learned to build Lambda dependencies in a **Lambda-compatible environment**  
- Used CloudWatch Logs to monitor execution, cold starts, and performance  
- Automated the entire stack using **Terraform from infra to code execution**  

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
├── Day-10/
│   ├── backend.tf
│   ├── backend.tf
│   ├── main.tf
│   ├── providers.tf
│   ├── variables.tf
│   └── output.tf
├── Day-11/
│   ├── backend.tf
│   ├── main.tf
│   ├── locals.tf
│   ├── variables.tf
│   └── output.tf
├── Day-12/
│   ├── backend.tf
│   ├── config.json
│   ├── main.tf
│   ├── providers.tf
│   ├── variables.tf
│   ├── locals.tf
│   ├── output.tf
│   └── terraform.tfvars
├── Day-13/
│   ├── backend.tf
│   ├── datasource.tf
│   ├── main.tf
│   ├── providers.tf
│   ├── variables.tf
│   ├── locals.tf
│   ├── output.tf
├── Day-14/
│   ├── backend.tf
│   ├── datasource.tf
│   ├── main.tf
│   ├── providers.tf
│   ├── variables.tf
│   ├── locals.tf
│   ├── output.tf
│   ├── www/                
│   │   ├── index.html     
│   │   ├── style.css       
│   │   └── script.js
├── Day-15/
│   ├── backend.tf
│   ├── data.tf
│   ├── locals.tf
│   ├── main.tf
│   ├── providers.tf
│   ├── variables.tf
├── Day-16/
│   ├── backend.tf
│   ├── data.tf
│   ├── groups.tf
│   ├── locals.tf
│   ├── main.tf
│   ├── mfa.tf
│   ├── providers.tf
│   ├── output.tf
│   ├── variables.tf
│   ├── users.csv
├── Day-17/
│   ├── app_versions/
│   │   ├── v1/
│   │   └── v2/
│   ├── scripts/
│   │   ├── package_apps.sh
│   │   └── package_apps.ps1
│   ├── main.tf
│   ├── blue_environment.tf
│   ├── green_environment.tf
│   ├── providers.tf
│   ├── outputs.tf
│   └── variables.tf
├── Day-18/
│   ├── lambda/
│   │   ├── lambda_function.py
│   │   └── requirements.txt
│   ├── scripts/
│   │   ├── build_layer_docker.sh
│   │   ├── deploy.sh
│   │   └── destroy.sh
│   ├── main.tf
│   ├── providers.tf
│   ├── outputs.tf
│   ├── variables.tf
│   └── terraform.tfvars
├── Day-19/ (Upcoming)
└── ... (Days 20-30)

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

**Updated:** December 14, 2025
**Progress:** 18/30 Days ✅
