resource "aws_instance" "first-instance" {
  ami           = "ami-0ff8a91507f77f867"
  instance_type = var.allowed_instance_type[1]
  # region = tolist(var.allowed_region)[2]
  region = var.config.region

  tags = var.tags

  lifecycle {
    prevent_destroy = true
    create_before_destroy = true
  }
}

# Create a securtiy group
resource "aws_security_group" "app_sg" {
  name        = "app-sg-${var.environment}"
  description = "Security group for application servers"

  ingress {
    from_port   = var.ingress_values_sg[0]
    to_port     = var.ingress_values_sg[1]
    protocol    = var.ingress_values_sg[2]
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP traffic"
  }
  egress {
    from_port   = var.egress_values[0]
    to_port     = var.egress_values[1]
    protocol    = var.egress_values[2]
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP traffic"
  }

  tags = var.tags
}

resource "aws_instance" "app_with_sg" {
  ami           = "ami-0ff8a91507f77f867"
  instance_type = var.allowed_instance_type[1]
  region        = var.config.region
  count         = var.config.instance_count
  monitoring    = var.config.monitoring_enabled
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  tags = var.tags

  lifecycle {
    replace_triggered_by = [ 
      aws_security_group.app_sg 
      ]
  }
}

# create an s3 bucket
resource "aws_s3_bucket" "compliance_bucket" {
  bucket = var.bucket_names[2]

  tags = var.tags

  lifecycle {

    precondition {
      condition     = contains(keys(var.tags), "Owner")
      error_message = "ERROR: Bucket must have an 'Owner' tag for identification purposes."
    }

    postcondition {
      condition     = contains(keys(var.tags), "Compliance")
      error_message = "ERROR: Bucket must have a 'Compliance' tag for audit purposes."
    }
  }
}