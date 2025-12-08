variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "Project ALPHA resource"
}

variable "environment" {
  default = "dev"
}

variable "default_tags" {
  default = {
    company    = "Adcorp"
    managed_by = "tf"
  }
}

variable "environment_tags" {
  default = {
    environment = "production"
    cost_center = "cc-1001"
  }
}

variable "bucket_name" {
  default = "ProjectAlphaStorageBucket with CAPS and Spaces!!!"
}

variable "allowed_ports" {
  default = "22,80,443,3306"
}

variable "instance_sizes" {
  default = {
    dev  = "t3.micro"
    qa   = "t2.small"
    prod = "t3.large"
  }
}

variable "instance_type" {
  default = "t3.micro"
}

variable "instant_type_condition" {
  default = "t3.micro"

  validation {
    condition     = length(var.instant_type_condition) >= 2 && length(var.instant_type_condition) <= 20
    error_message = "Instance type must be between 2 and 20 characters long."
  }

  validation {
    condition     = can(regex("^t[3-2]\\.", var.instant_type_condition))
    error_message = "Instance type must start with 't2.' or 't3.'"
  }
}

variable "backup_name" {
  default = "daily_backup"

  validation {
    condition     = endswith(var.backup_name, "_backup")
    error_message = "Backup name must end with '_backup'"
  }
}

variable "credentials" {
  default   = "Passw0rd123!"
  sensitive = true
}

variable "user_location" {
  default = ["us-east-1", "us-west-2, us-east-1"]
}

variable "default_location" {
  default = ["ap-south-1"]
}

variable "monthly_costs" {
  default = ["-50", "100", "200", "-20", "300"]
}

variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
  default = {
    Environment = "dev"
    Owner       = "Adnan"
    Project     = "Terraform Learning"
    Compliance  = "Yes"
  }
}

variable "bucket_name_project" {
  default = "adnan-mini-project-bucket-tf"
}