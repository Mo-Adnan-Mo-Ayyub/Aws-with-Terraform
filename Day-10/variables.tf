variable "environment" {
  default     = "dev"
  type        = string
  description = "Environment for resource naming"
}

variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
}

variable "monitoring_enabled" {
  description = "Enable detailed monitoring for EC2 instances"
  type        = bool
  default     = true
}

variable "associate_public_ip" {
  description = "Associate a public IP address with the EC2 instances"
  type        = bool
  default     = true

}

variable "cidr_block" {
  description = "CIDR block for VPC"
  type        = list(string)
  default     = ["10.0.0.0/8", "192.168.0.0/16", "172.168.0.0/12", ]
}

variable "allowed_instance_type" {
  description = "Allowed instance types for EC2"
  type        = list(string)
  default     = ["t2.micro", "t3.micro", "t3a.micro"]

}

variable "allowed_region" {
  description = "Allowed regions for EC2"
  type        = set(string)
  default     = ["us-east-1", "us-west-2", "ap-south-1"]
}

variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
  default = {
    Name        = "adnan-terraform-learning"
    Environment = "dev"
    Owner       = "Adnan"
    Project     = "Terraform Learning"
    Compliance  = "Yes"
  }
}

variable "ingress_values" {
  description = "List of ingress CIDR blocks"
  type        = tuple([number, string, number])
  default     = [443, "tcp", 443]
}

variable "egress_values" {
  description = "List of ingress CIDR blocks"
  type        = tuple([number, number, string])
  default     = [0, 0, "-1"]
}

variable "ingress_values_sg" {
  description = "List of ingress values for security group"
  type        = tuple([number, number, string])
  default     = [80, 80, "tcp", ]
}

variable "config" {
  type = object({
    region             = string,
    monitoring_enabled = bool,
    instance_count     = number
  })
  default = {
    instance_count     = 1,
    region             = "ap-south-1",
    monitoring_enabled = true
  }
}

variable "bucket_names" {
  description = "List of S3 bucket names"
  type        = list(string)
  default     = ["adnan-terraform-bucket-1-day08", "adnan-terraform-bucket-2-day08", "adnan-terraform-bucket-1-day09", "adnan-terraform-bucket-2-day09"]

}

variable "bucket_names-set" {
  description = "List of S3 bucket names"
  type        = set(string)
  default     = ["adnan-terraform-bucket-01-day08", "adnan-terraform-bucket-02-day08"]
}

variable "ingress_rule_dynamic_block" {
  description = "List of ingress rules for testing dynamic block expression"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
  default = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow HTTP traffic"
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow HTTPS traffic"
    }
  ]
}

variable "egress_rule_dynamic_block" {
  description = "List of engress rules for testing dynamic block expression"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow all outbound traffic"
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow SSH outbound traffic"
    }
  ]
}