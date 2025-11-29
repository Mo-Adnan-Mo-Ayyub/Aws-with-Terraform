terraform {

  backend "s3" {
    bucket = "adnan-terraform-state-bucket"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    encrypt = true # Enable server-side encryption
    use_lockfile = true # Built-in DynamoDB table for state locking in S3 backend
  }
}