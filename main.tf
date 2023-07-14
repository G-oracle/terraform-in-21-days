locals {
  public_cidr  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_cidr = ["10.0.20.0/24", "10.0.21.0/24"]
}

# Create Main VPC

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main"
  }
}

# Creates 2 public subnets

resource "aws_subnet" "public" {
  count      = length(local.public_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = local.public_cidr[count.index]

  tags = {
    Name = "public${count.index}"
  }
}

# Creates 2 private 2 subnets

resource "aws_subnet" "private" {
  count      = length(local.private_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = local.private_cidr[count.index]

  tags = {
    Name = "private${count.index}"
  }
}

# Creates the Internet Gateway for the External Access to the VPC
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

# Adding Elastic IP addresses for the NAT Gateways
resource "aws_eip" "nat" {
  count = length(local.public_cidr)
  vpc   = true

  tags = {
    Name = "nat${count.index}"
  }
}

# Creates 2 NAT Gateways
resource "aws_nat_gateway" "main" {
  count         = length(local.public_cidr)
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id

  tags = {
    Name = "main${count.index}"
  }
}

#Creates 1 Route Table for the Public Subnet and for each Private Subnets
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "public"
  }
}

resource "aws_route_table" "private" {
  count  = length(local.private_cidr)
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main[count.index].id
  }

  tags = {
    Name = "private${count.index}"
  }
}

# Creates route paths for association between the subnets
resource "aws_route_table_association" "public" {
  count          = length(local.public_cidr)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count          = length(local.private_cidr)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[count.index].id
}
