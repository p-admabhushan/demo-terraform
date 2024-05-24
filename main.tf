provider "google" {
  project     = "demo-terraform"
  credentials = "${file("..\\my-creds.json")}"
  region      = "us-central1"
  zone        = "us-central1-a"
}

resource "google_compute_instance" "vm-from-terraform"{
    name    = "acme_vm_1"
    machine_type = "e2-micro"    

    boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  network_interface {
    network = "default"    
  }

   metadata_startup_script = "echo hi > /test.txt"

   allow_stopping_for_update=true


}
