# Create an ec2 instance
resource "aws_instance" "first_instance" {
  count         = var.instance_count
  ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64" # This will capture the Amazon Linux Image ID (AMI)
  instance_type = var.allowed_instance_type[1]
#  region        = tolist(var.allowed_region)[0]
  region = var.config.region

  monitoring                  = var.monitoring_enabled
  associate_public_ip_address = var.associate_public_ip

  tags = var.tags
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"

  tags = var.tags
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.cidr_block[0]
  from_port         = var.ingress_values.0
  ip_protocol       = var.ingress_values.1
  to_port           = var.ingress_values.2
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

