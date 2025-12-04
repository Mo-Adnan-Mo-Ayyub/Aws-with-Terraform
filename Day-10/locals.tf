locals {
  all_instance_ids = aws_instance_conditional_instance[*].id
}