variable "environment" {
  default = "dev"
}

variable "instance_type" {
  description = "The EC2 Tnstance Type"
  type        = string
  default     = "t3.micro"
}

variable "primary" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "secondary" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-west-2"
}

variable "primary_vpc_cidr" {
  description = "CIDR block for the primary VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "secondary_vpc_cidr" {
  description = "CIDR block for the primary VPC"
  type        = string
  default     = "10.1.0.0/16"
}

variable "primary_sg" {
  description = "Security Group for Primary VPC"
  type        = string
  default     = "Primary-SG"
}

variable "secondary_sg" {
  description = "Security Group for Secondary VPC"
  type        = string
  default     = "Secondary-SG"
}

variable "primary_subnet_cidr" {
  description = "CIDR block for primary subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "secondary_subnet_cidr" {
  description = "CIDR block for secondary subnet"
  type        = string
  default     = "10.1.1.0/24"
}

variable "primary_key_name" {
  description = "The name of SSH key pir for primary vpc instance"
  type        = string
  default     = ""
}

variable "secondary_key_name" {
  description = "The name of SSH key pir for secondary vpc instance"
  type        = string
  default     = ""
}