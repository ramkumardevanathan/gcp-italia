#Directory = /home/tf-agent/tf-dir/compute-engine
#File1 = main.tf

#File =main.tf
provider "google" {
        project = var.project_id
        region  = var.region
        }


variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "name" {
  type = string
}

variable "machine_type" {
  type = string
  default = "n1-standard-1"
}

variable "zone" {
  type = string
}

variable "tags" {
  type = list(string)
  default = ["foo", "bar"]
}

variable "image" {
  type = string
  default = "debian-cloud/debian-9"
}

variable "interface" {
  type = string
  default = "SCSI"
}

variable "network" {
  type = string
}

variable "metadata" {
  type = map(string)
  default = {
    "test" = "meta"
  }
}


resource "google_compute_instance" "default" {
  name         = var.name        
  machine_type = var.machine_type
  zone         = var.zone        

  tags = var.tags

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  scratch_disk {
    interface = var.interface
  }

  network_interface {
    network = var.network

    access_config {
    }
  }

  metadata = var.metadata
}

