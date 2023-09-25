# VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "${local.naming_prefix}-${var.vpc_name}"
  }
}

# Enable EIP
resource "aws_eip" "eip" {
  vpc = true
}





#----------------------------------------------------------------------------
# ACLs
#----------------------------------------------------------------------------

# NACLs to public subnet
resource "aws_network_acl" "nacls_to_public_subnet" {
  vpc_id = aws_vpc.vpc.id

  ingress {
    protocol = "tcp"
    rule_no = 100
    action = "allow"
    # todo
    cidr_block = "10.3.0.0/18"
    from_port = 80
    to_port = 80
  }

  egress {
    protocol = "tcp"
    rule_no = 200
    action = "allow"
    # todo
    cidr_block = "10.3.0.0/18"
    from_port = 443
    to_port = 443
  }

  tags = {
    Name = "${local.naming_prefix}-nacls-to-public-subnet"
  }
}
