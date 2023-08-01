resource "google_compute_network" "vpc_network" {
  name = "terraform-network"

}

resource "google_compute_subnetwork" "public-subnetwork" {
  name          = "terraform-subnetwork"
  ip_cidr_range = var.vpc_cidr_block
  region        = var.region
  network       = google_compute_network.vpc_network.name
}