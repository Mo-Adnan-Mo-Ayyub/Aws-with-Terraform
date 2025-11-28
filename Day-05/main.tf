# Create an S3 bucket
resource "aws_s3_bucket" "first_bucket" {
  bucket = local.bucket_name
  tags = {
    Name        = local.bucket_name
    Environment = var.environment
  }
}

# Create a vpc
resource "aws_vpc" "first_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name        = local.vpc_name
    Environment = var.environment
  }
}

# Create an ec2 instance
resource "aws_instance" "first_instance" {
  ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64" # This will capture the Amazon Linux Image ID (AMI)
  instance_type = var.instance_type
  region        = var.region

  tags = {
    Name        = local.ec2_name
    Environment = var.environment
  }
}