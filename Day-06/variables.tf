variable "environment" {
  default     = "dev"
  type        = string
  description = "Environment for resource naming"
}

variable "region" {
  default     = "us-east-1"
  description = "default region"
}

variable "channel_name" {
  default     = "adnan-terraform-learning"
  description = "Channel name for resource naming"
  type        = string
}

variable "instance_type" {
  default     = "t3.micro"
  description = "EC2 instance type"
  type        = string
}