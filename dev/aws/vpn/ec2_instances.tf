
data "aws_key_pair" "ssh_key" {
  key_name           = "examKP"
  include_public_key = true
}

output "name" {
  value = data.aws_key_pair.ssh_key.key_name
}

resource "aws_instance" "webserver_ec2_instance" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.webserver_db_subnet.id
  security_groups = [aws_security_group.webserver_public_sg.id]
  key_name = data.aws_key_pair.ssh_key.key_name
  associate_public_ip_address = true
  user_data = file("../${path.module}/templates/install_docker.tpl")
  /*
  disable_api_termination = false
  ebs_optimized = false
  root_block_device {
    volume_size = "10"
  }
  */
  tags = {
    "Name" = "${var.naming_prefix}-webserver"
  }
}

output "webserver_ec2_instance_public_ip" {
  value = aws_instance.webserver_ec2_instance.public_ip
}

resource "aws_instance" "db_ec2_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.db_private_subnet.id
  key_name      = data.aws_key_pair.ssh_key.key_name
  security_groups = [aws_security_group.db_private_sg.id]
  user_data = file("../${path.module}/templates/install_docker.tpl")
  tags = {
    "Name" = "${var.naming_prefix}-db"
  }
}

output "db_ec2_instance_private_ip" {
  value = aws_instance.db_ec2_instance.private_ip
}
