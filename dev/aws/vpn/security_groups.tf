resource "aws_security_group" "webserver_public_sg" {
  name = "${local.naming_prefix}-webserver-sg"
  vpc_id = aws_vpc.vpc.id
  description = "Allow SSH and TLS inbound traffic"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TLS from VPC"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${local.naming_prefix}-webserver-sg"
  }
}

resource "aws_security_group" "db_private_sg" {
  name        = "${var.naming_prefix}-db-sg"
  vpc_id = aws_vpc.vpc.id
  description = "Security group for private instances"

  # Ingress rule to allow SSH access from the public security group
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
   security_groups = [aws_security_group.webserver_public_sg.id]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${local.naming_prefix}-db-sg"
  }
}