data "aws_availability_zones" "available" {}

# Webserver Subnet
resource "aws_subnet" "webserver_db_subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.subnets_cidr_block[0]
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "${local.naming_prefix}-webserver-subnet"
  }
}

# Database Subnet
resource "aws_subnet" "db_private_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block = var.subnets_cidr_block[1]
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = false
  tags = {
    Name = "${local.naming_prefix}-db-subnet"
  }
}

# Associate the webserver subnet to the route table
resource "aws_route_table_association" "webserver_rt_to_subnet" {
  subnet_id = aws_subnet.webserver_db_subnet.id
  route_table_id = aws_route_table.webserver_rt.id
}

# Associate the db private subnet to the route table
resource "aws_route_table_association" "db_private_rt_to_subnet" {
  subnet_id = aws_subnet.db_private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}