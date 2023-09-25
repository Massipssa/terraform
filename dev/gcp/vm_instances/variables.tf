variable "project" {
  type = string
  default = "phonic-agility-279410"
  description = "GCP project name"
}

variable "region" {
  type = string
  default = "us-central1"
  description = "Region to use to create resources"
}

variable "zone" {
  type = string
  default = "us-central1-a"
}

## VM
variable "vm_name" {
  type = string
  default = "terraform-instance"
}

variable "vm_types" {
  type = map(string)
  default = {
    small = "e2-micro"
  }
}
