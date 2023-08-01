variable "project" {
  type        = string
  default     = "phonic-agility-279410"
  description = "GCP project name"
}

variable "region" {
  type        = string
  default     = "us-central1"
  description = "Region to use to create resources"
}

variable "zone" {
  type    = string
  default = "us-central1-a"
}

## Network
variable "vpc_name" {
  type        = string
  default     = "default"
  description = "VPC name to use to create resources"
}

variable "subnet_name" {
  type        = string
  default     = "test-subnet"
}

variable "ipv4_cidr_block" {
  type    = string
  default = "10.0.0.0/24"

  validation {
    condition     = can(cidrhost(var.ipv4_cidr_block, 0))
    error_message = "Must be valid IPv4 CIDR."
  }
}

## VM
variable "vm_name" {
  type    = string
  default = "terraform-instance"
}

variable "vm_types" {
  type = map(string)
  default = {
    small = "e2-micro"
  }
}