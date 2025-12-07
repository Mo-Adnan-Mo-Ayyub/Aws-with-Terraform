data "aws_vpc" "datasource_vpc" {
  filter {
    name   = "tag:Name"
    values = ["default"]
  }
}

data "aws_subnets" "datasource_subnets" {
  filter {
    name   = "tag:Name"
    values = ["datasource-subnet"]
  }
  #vpc_id = data.aws_vpc.datasource_vpc.id
}

data "aws_ami" "datasource_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
