terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Create an S3 bucket
resource "aws_s3_bucket" "first_bucket" {
  bucket = "adnan-terraform-learning-bucket-demo"
  tags = {
    Name        = "MyFirstTerraformBucket"
    Environment = "dev"
  }
}