# provides information about the provider to use
/*
provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}
*/

# the resource to create in the target environment
/*
resource "aws_key_pair" "test_key" {
  public_key = file("ssh/test_key.ppk")
}
*/


/*
// resource "aws_security_group" "test_security_group" {}

resource "aws_instance" "dev_server" {
  ami           = var.ami
  instance_type = var.instance_type
  // key_name = aws_key_pair.test_key.key_name

  // create one instance
  #count = 1

  # copy docker-compose file and install-docker.sh
  provisioner "file" {
    source      = "/home/massi/dev/scripts/*"
    destination = "/opt/tools/"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /opt/tools/docker/install-docker.sh",
      "/opt/install-docker.sh"
      //"docker-compose"
    ]
  }

  // security groups to be used by application
  // security_groups = ["${aws_security_group.test_security_group.name}"]

  tags = local.common_tags
}
*/