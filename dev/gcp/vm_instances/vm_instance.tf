resource "google_compute_instance" "vm_instance" {
  name = var.vm_name
  machine_type = var.vm_types.small

  # During the creation of the image
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network =  "default" #var.vpc_name
    subnetwork = google_compute_subnetwork.subnet.name

    access_config {
      nat_ip = google_compute_address.static_ip.address
    }
  }
  /*
  metadata = {
        ssh-keys = "massipssa:${file("~/.ssh/id_rsa.pub")}"
  }
  */
}