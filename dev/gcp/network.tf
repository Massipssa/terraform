# VPC
resource "google_compute_network" "vpc_network" {
  name = var.vpc_name
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.ipv4_cidr_block 
  region        = var.region
  network       = google_compute_network.vpc_network.name
}

# Static IP
resource "google_compute_address" "static_ip" {
  name = "${var.vm_name}-static-ip"
}