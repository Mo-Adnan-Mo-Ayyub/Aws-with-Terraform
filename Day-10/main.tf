# Conditional Expression Example in Terraform

resource "aws_instance" "conditional_instance" {
  ami   = "ami-0912f71e06545ad88"
  count = var.instance_count
  #  instance_type = var.allowed_instance_type[1]
  instance_type = var.environment == "dev" ? var.allowed_instance_type[1] : var.allowed_instance_type[0]
  # if environment is dev, use t3.micro else t2.micro (conditional expression ? true : false)
  tags = var.tags
}

# Dynamic Block Example in Terraform

resource "aws_security_group" "conditional_sg" {
  name = "sg"

  dynamic "ingress" {
    for_each = var.ingress_rule_dynamic_block
    content {
      from_port   = ingress_rule_dynamic_block.value.from_port
      to_port     = ingress_rule_dynamic_block.value.to_port
      protocol    = ingress_rule_dynamic_block.value.protocol
      cidr_blocks = ingress_rule_dynamic_block.value.cidr_blocks
      description = ingress_rule_dynamic_block.value.description
    }
  }

  dynamic "egress" {
    for_each = var.egress_rule_dynamic_block
    content {
      from_port   = egress_rule_dynamic_block.value.from_port
      to_port     = egress_rule_dynamic_block.value.to_port
      protocol    = egress_rule_dynamic_block.value.protocol
      cidr_blocks = egress_rule_dynamic_block.value.cidr_blocks
      description = egress_rule_dynamic_block.value.description
    }
  }
}