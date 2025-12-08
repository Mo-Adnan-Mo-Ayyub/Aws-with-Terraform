locals {
  origin_id = "S3-${aws_s3_bucket.mini_project_bucket.id}"

  mini_project_route53_domain = "mini_project_s3.com"
}