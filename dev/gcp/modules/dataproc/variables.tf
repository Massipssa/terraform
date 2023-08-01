variable "project_id" {
  type        = string
  description = "Project id in GCP"
}

variable "region" {
  type        = string
  default     = "us-central1"
  description = "Region where to create resources"
}

variable "cluster_name" {
  type    = string
  default = "Dataproc cluster name"
}

variable "graceful_decommission_timeout" {
  type    = string
  default = "120s"
}

variable "staging_bucket" {
  type    = string
  default = "dataproc-staging-bucket"
}

# Cidr IPv4
variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/24"

  validation {
    condition     = can(cidrhost(var.vpc_cidr_block, 0))
    error_message = "Must be valid IPv4 CIDR."
  }
}

// add allowed variables
variable "environment" {
  type    = string
  default = "development"
}