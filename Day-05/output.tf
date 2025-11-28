output "vpc_id" {
  value       = aws_vpc.first_vpc.id
  description = "The ID of the created VPC"
}

output "instance_public_ip" {
  value       = aws_instance.first_instance.public_ip
  description = "The Public IP of the created ec2 instance"
}

output "instance_id" {
  value       = aws_instance.first_instance.id
  description = "The ID of the created ec2 instance"
}