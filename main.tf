data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
data "aws_availability_zones" "available" {}

# Get latest Amazon Windows Server 2022 Ami
data "aws_ami" "windows-2022" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["Windows_Server-2022-English-Full-Base*"]
  }
}


locals {
  aws_account_id = data.aws_caller_identity.current.account_id
  aws_region     = data.aws_region.current.name
}

data "aws_vpc" "selected" {
  filter {
    name   = "cidr"
    values = ["10.10.0.0/16"] # Ajusta el CIDR de tu VPC
  }
}

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }

  tags = {
    Subnet = "private"
  }
}

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }

  tags = {
    Subnet = "public"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = data.aws_vpc.selected.id
  cidr_block              = var.subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = false
  tags = {
    Name   = "private-subnet-${var.env}-2",
    Subnet = "private"
  }
}

resource "aws_route_table_association" "private_rta_2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = var.route_table_id
}

resource "aws_route_table_association" "private_rta_1" {
  subnet_id      = "subnet-5c39db2b"
  route_table_id = var.route_table_id
}

resource "aws_eip" "nat_gateway" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = "subnet-5b39db2c" # ID de tu subnet pública
  tags = {
    Name = "nat-gateway-${var.env}"
  }
}

resource "aws_route" "private_nat_route" {
  route_table_id         = var.route_table_id # Tu tabla de rutas de subnets privadas
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gw.id
}
