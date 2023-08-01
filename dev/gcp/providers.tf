provider "google" {
  version = "3.5.0"
  #credentials = file("/home/massi/dev/gcp/credential_key.json")
  project = var.project
  region  = var.region
  zone    = var.zone
}