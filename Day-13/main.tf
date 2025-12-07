resource "aws_instance" "datasource_instance" {
  ami           = data.aws_ami.datasource_ami
  instance_type = var.instance_type
  subnet_id     = data.aws_subnets.datasource_subnets.id

  tags = var.tags
}