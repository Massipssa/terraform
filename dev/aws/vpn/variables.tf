variable "aws_region" {
  type = string
  description = "Region for AWS Resources"
  default = "us-east-1"
}

variable "vpc_name" {
  type = string
  default = "vpc"
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "subnets_cidr_block" {
  type = list(string)
  description = "CIDR Block Subnets in VPC"
  default = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "env" {
  type = string
  description = "Environment on which resources will be deployed"
  default = "dev"
}

variable "naming_prefix" {
  type = string
  description = "Naming prefix for all resources."
  default = "web-app"
}

variable "instance_type" {
  type = string
  description = "Type for EC2 Instance"
  default = "t2.micro"
}

variable "ami" {
  type = string
  description = "IAM id"
  default = "ami-03a6eaae9938c858c"
}

