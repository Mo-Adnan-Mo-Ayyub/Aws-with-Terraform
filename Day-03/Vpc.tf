# Create a vpc
resource "aws_vpc" "first_vpc" {
  cidr_block = "192.168.1.0/24"
  tags = {
    Name = "first_vpc"
    Environment = "dev"
    }
}