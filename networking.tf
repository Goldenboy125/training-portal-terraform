
# Find two available AWS Availability Zones
data "aws_availability_zones" "available" {
  state = "available"
}

# Main VPC
resource "aws_vpc" "training_portal" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

# Internet Gateway for public subnets
resource "aws_internet_gateway" "training_portal" {
  vpc_id = aws_vpc.training_portal.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

# Two public subnets
resource "aws_subnet" "public" {
  count = 2

  vpc_id                  = aws_vpc.training_portal.id
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  cidr_block              = cidrsubnet(var.vpc_cidr, 4, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-public-${count.index + 1}"
    Tier = "Public"
  }
}

# Two private subnets
resource "aws_subnet" "private" {
  count = 2

  vpc_id            = aws_vpc.training_portal.id
  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = cidrsubnet(var.vpc_cidr, 4, count.index + 2)

  tags = {
    Name = "${var.project_name}-private-${count.index + 1}"
    Tier = "Private"
  }
}

# Public route table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.training_portal.id

  tags = {
    Name = "${var.project_name}-public-rt"
  }
}

# Route public subnet internet traffic through the Internet Gateway
resource "aws_route" "public_internet" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.training_portal.id
}

# Associate public subnets with public route table
resource "aws_route_table_association" "public" {
  count = 2

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# Private route table (no internet route or NAT Gateway)
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.training_portal.id

  tags = {
    Name = "${var.project_name}-private-rt"
  }
}

# Associate private subnets with private route table
resource "aws_route_table_association" "private" {
  count = 2

  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}
