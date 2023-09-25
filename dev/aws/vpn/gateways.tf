# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${local.naming_prefix}-igw"
  }
}

# NAT Gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.webserver_db_subnet.id

  tags = {
    Name = "${var.naming_prefix}-NAT-gw"
  }
  # Ensure that Internet Gateway is created
  depends_on = [aws_internet_gateway.igw]
}