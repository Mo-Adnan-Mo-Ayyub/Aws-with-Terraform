resource "aws_s3_bucket" "bucket_function" {
  bucket = local.formatted_bucket_name

  tags = local.required_tags
}

