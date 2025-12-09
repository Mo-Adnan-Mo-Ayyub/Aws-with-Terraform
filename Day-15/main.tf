resource "aws_vpc" "primary_vpc" {
  cidr_block           = var.primary_vpc_cidr
  provider             = aws.primary
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name    = "Primary-VPC-${var.primary}"
    Project = "VPC-Peering"
  }
}

resource "aws_vpc" "secondary_vpc" {
  cidr_block           = var.secondary_vpc_cidr
  provider             = aws.secondary
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name    = "Secondary-VPC-${var.secondary}"
    Project = "VPC-Peering"
  }
}

resource "aws_subnet" "primary_subnet" {
  provider                = aws.primary
  vpc_id                  = aws_vpc.primary_vpc.id
  cidr_block              = var.primary_vpc_cidr
  availability_zone       = data.aws_availability_zones.primary.names[0]
  map_public_ip_on_launch = true


  tags = {
    Name    = "Primary-Subnet-${var.primary}"
    Project = "VPC-Peering"
  }
}

resource "aws_subnet" "secondary_subnet" {
  provider                = aws.secondary
  vpc_id                  = aws_vpc.secondary_vpc.id
  cidr_block              = var.secondary_vpc_cidr
  availability_zone       = data.aws_availability_zones.secondary.names[0]
  map_public_ip_on_launch = true


  tags = {
    Name    = "Secondary-Subnet-${var.secondary}"
    Project = "VPC-Peering"
  }
}

resource "aws_internet_gateway" "primary_igw" {
  provider = aws.primary
  vpc_id   = aws_vpc.primary_vpc.id

  tags = {
    Name    = "Primary-IGW-${var.primary}"
    Project = "VPC-Peering"
  }
}

# resource "aws_eip" "primary_nat_eip" {
# provider = aws.primary
# vpc = true
# }


# resource "aws_nat_gateway" "primary_nat" {
# provider = aws.primary
# allocation_id = aws_eip.primary_nat_eip.id
# subnet_id = aws_subnet.primary_public.id


# tags = {
# Name = "Primary-NAT"
# }
# }


# resource "aws_eip" "secondary_nat_eip" {
# provider = aws.secondary
# vpc = true
# }


# resource "aws_nat_gateway" "secondary_nat" {
# provider = aws.secondary
# allocation_id = aws_eip.secondary_nat_eip.id
# subnet_id = aws_subnet.secondary_public.id


# tags = {
# Name = "Secondary-NAT"
# }
# }

resource "aws_internet_gateway" "secondary_igw" {
  provider = aws.secondary
  vpc_id   = aws_vpc.secondary_vpc.id

  tags = {
    Name    = "Secondary-IGW-${var.secondary}"
    Project = "VPC-Peering"
  }
}

resource "aws_route_table" "primary_rt" {
  provider = aws.primary
  vpc_id   = aws_vpc.primary_vpc.id

  route {
    cidr_block = "0.0.0.0/0" # make it private or secure
    gateway_id = aws_internet_gateway.primary_igw.id
  }

  tags = {
    Name    = "Primary-RT-${var.primary}"
    Project = "VPC-Peering"
  }
}

# resource "aws_route_table" "primary_private_rt" {
#   provider = aws.primary
#   vpc_id = aws_vpc.primary_vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.primary_nat.id
#   }

#   tags = {
#     Name    = "Primary-Private-RT-${var.primary}"
#     Project = "VPC-Peering"
#   }
# }

resource "aws_route_table" "secondary_rt" {
  provider = aws.secondary
  vpc_id   = aws_vpc.secondary_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.secondary_igw.id
  }

  tags = {
    Name    = "Secondary-RT-${var.secondary}"
    Project = "VPC-Peering"
  }
}


# resource "aws_route_table" "secondary_private_rt" {
#   provider = aws.secondary
#   vpc_id = aws_vpc.Secondary_vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.Secondary_nat.id
#   }

#   tags = {
#     Name    = "Secondary-Private-RT-${var.Secondary}"
#     Project = "VPC-Peering"
#   }
# }
resource "aws_route_table_association" "primary_rta" {
  provider       = aws.primary
  subnet_id      = aws_subnet.primary_subnet.id
  route_table_id = aws_route_table.primary_rt.id

}

resource "aws_route_table_association" "secondary_rta" {
  provider       = aws.secondary
  subnet_id      = aws_subnet.secondary_subnet.id
  route_table_id = aws_route_table.secondary_rt.id

}

resource "aws_vpc_peering_connection" "primary_to_secondary_peering" {
  provider    = aws.primary
  vpc_id      = aws_vpc.primary_vpc.id
  peer_vpc_id = aws_vpc.secondary_vpc.id
  peer_region = var.secondary
  auto_accept = false

  tags = {
    Name    = "Primary-to-Secondary-Vpc-Peering"
    Project = "VPC-Peering"
    Side    = "Requester"
  }
}

resource "aws_vpc_peering_connection_accepter" "secondary_accepter" {
  provider                  = aws.secondary
  vpc_peering_connection_id = aws_vpc_peering_connection.primary_to_secondary_peering.id
  auto_accept               = true


  tags = {
    Name    = "Secondary-to-Primary-Vpc-Peering"
    Project = "VPC-Peering"
    Side    = "Requester"
  }
}

resource "aws_route" "primary_to_secondary_route" {
  provider                  = aws.primary
  route_table_id            = aws_route_table.primary_rt.id
  destination_cidr_block    = var.secondary_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.primary_to_secondary_peering.id

  depends_on = [aws_vpc_peering_connection_accepter.secondary_accepter]
}

resource "aws_route" "secondary_to_primary_route" {
  provider                  = aws.secondary
  route_table_id            = aws_route_table.secondary_rt.id
  destination_cidr_block    = var.primary_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.primary_to_secondary_peering.id

  depends_on = [aws_vpc_peering_connection_accepter.secondary_accepter]
}

resource "aws_security_group" "primary_sg" {
  provider = aws.primary
  name     = var.primary_sg
  vpc_id   = aws_vpc.primary_vpc.id

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["152.58.16.225"] 
  }

  ingress {
    description = "ICMP from Secondary VPC"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [var.secondary_vpc_cidr]
  }

  ingress = {
    description = "All trafic from Secondary VPC"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = [var.secondary_vpc_cidr]
  }

  egress = {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_block  = ["0.0.0.0/0"]
  }

  tags = {
    Name    = Primary-VPC-SG
    Project = "VPC-Peering"
  }
}

resource "aws_security_group" "secondary_sg" {
  provider = aws.secondary
  name     = var.secondary_sg
  vpc_id   = aws_vpc.secondary_vpc.id

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["152.58.16.225"] 
  }

  ingress {
    description = "ICMP from Primary VPC"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [var.primary_vpc_cidr]
  }

  ingress = {
    description = "All trafic from Primary VPC"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = [var.primary_vpc_cidr]
  }

  egress = {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_block  = ["0.0.0.0/0"]
  }

  tags = {
    Name    = Secondary-VPC-SG
    Project = "VPC-Peering"
  }
}

resource "aws_instance" "primary_instance" {
  provider               = aws.primary
  ami                    = data.aws_ami.primary_ami.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.primary_subnet.id
  vpc_security_group_ids = [aws_security_group.primary_sg]
  key_name               = var.primary_key_name

  user_data = local.primary_user_data

  tags = {
    Name    = Primary-VPC-Instance
    Project = "VPC-Peering"
    region  = var.primary
  }

  depends_on = [aws_vpc_peering_connection_accepter.secondary_accepter]
}

resource "aws_instance" "secondary_instance" {
  provider               = aws.secondary
  ami                    = data.aws_ami.secondary_ami.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.secondary_subnet.id
  vpc_security_group_ids = [aws_security_group.secondary_sg]
  key_name               = var.secondary_key_name

  user_data = local.secondary_user_data

  tags = {
    Name    = Secondary-VPC-Instance
    Project = "VPC-Peering"
    region  = var.secondary
  }

  depends_on = [aws_vpc_peering_connection_accepter.secondary_accepter]
}