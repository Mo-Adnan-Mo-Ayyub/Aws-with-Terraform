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