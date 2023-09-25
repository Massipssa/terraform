variable "aws_region" {
  type = string
  description = "Region for AWS Resources"
  default = "us-east-1"
}

# VPC
variable "vpn_name" {
  description = "VPN name"
  type = string
  default = "test-VPC"
}

variable "vpc_cidr_block" {
  type        = string
  description = "Base CIDR Block for VPC"
  default     = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames in VPC"
  default     = true
}

# Subnets
variable "vpc_public_subnet_count" {
  type = number
  default = 3
}

variable "subnets_cidr_block" {
  type = list(string)
  description = "CIDR Block Subnets in VPC"
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Map a public IP address for Subnet instances"
  default     = true
}


