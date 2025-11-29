locals {
  bucket_name = "${var.channel_name}-bucket-${var.environment}"
  vpc_name    = "${var.channel_name}-vpc-${var.environment}"
  ec2_name    = "${var.channel_name}-ec2-${var.environment}"
}