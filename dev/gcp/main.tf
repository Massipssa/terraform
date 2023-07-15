provider "google" {
  version = "3.5.0"
  credentials = file("/home/massi/dev/gcp/credential_key.json")
  project = var.project
  region = var.region
  zone = var.zone
}

# create vpc resource
resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

# ??
terraform {
  backend "gcs" {
    bucket = "terraform-test-1-massi"
    prefix = "terraform1"
    credentials = "/home/massi/dev/gcp/credential_key.json"
  }
}

# Modules

