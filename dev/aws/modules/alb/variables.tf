# VPC
variable "vpc_id" {
  description = "VPC id where to deploy resources"
  type = string
  default = null
}

variable "azs" {
  description = ""
  type = list(string)
  default = []
}

# S3
variable "create_bucket_logs" {
  description = "Check if the Load Balancer should be created"
  type = bool
  default = true
}

variable "lb_bucket_name" {
  description = "Name of the bucket where to store logs"
  type = string
}

variable "s3_tags" {
  description = "A map of tags to add s3 bucket"
  type = map(string)
  default = {}
}

# Load balancer
variable "lb_name" {
  description = "Load Balancer name"
  type = string
}

variable "lb_type" {
  description = "Load Balancer type"
  type = string
  default = "application"
}

variable "lb_tags" {
  description = "A map of tags to add to load balancer"
  type = map(string)
  default = {}
}

variable "lb_security_group_name" {
  description = "Load Balancer security group name"
  type = string
}

variable "subnets" {
  description = ""
  type = list(string)
  default = null
}

variable "subnet_mapping" {
  description = "A list of subnet mapping blocks describing subnets to attach to network load balancer"
  type        = list(map(string))
  default     = []
}

# Autoscaling group
variable "desired_capacity" {
  description = ""
  type = number
  default = 1
}

variable "max_size" {
  description = ""
  type = number
  default = 1
}

variable "min_size" {
  description = ""
  type = number
  default = 1
}

variable "ami" {
  type = string
  description = "IAM id"
  default = "ami-03a6eaae9938c858c"
}
