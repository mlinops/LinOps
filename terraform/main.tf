#The Terraform Google provider is a plugin that allows Terraform to manage resources on Google Cloud Platform. 


provider "google" {
    #credentials = file("test.json")
    project     = "onyx-osprey-371920"
    region      = "us-central1"
    zone        = "us-central1-a"
}

terraform {
  backend "gcs" {
    bucket      = "linops-bucket"
    prefix      = "terraform/state"
  }
}

#tfsec:ignore:block-project-ssh-keys tfsec:ignore:kms_key_self_link
resource "google_compute_instance" "server" {
    name            = "gcp-server-1-${terraform.workspace}"
    machine_type    = "e2-micro"

    shielded_instance_config {
        enable_vtpm = true
        enable_integrity_monitoring = true
    }
 
    boot_disk {
        initialize_params {
            image = "ubuntu-2004-lts"
        }
    }

        network_interface {
            network = "default"
        }


    metadata = {
        block-project-ssh-keys = false
        enable-oslogin: true
        serial-port-enable: false
        ssh-keys = "${var.gce_ssh_ansible_user}:${file(var.gce_ssh_pub_key_file_ansible)} \n ${var.gce_ssh_default_user}:${file(var.gce_ssh_pub_key_file_default)}"
        }

    metadata_startup_script = file("./startup/ansible-start-ubuntu.sh")
}

resource "google_compute_instance" "server-2" {
    name = "gcp-server-2-${terraform.workspace}"
    machine_type = "e2-micro"

    shielded_instance_config {
        enable_vtpm = true
        enable_integrity_monitoring = true
    }

    boot_disk {
        initialize_params {
            image = "centos-7-v20200403"
        }
    }
        network_interface {
            network = "default"
        }

    metadata = {
        block-project-ssh-keys = false
        enable-oslogin: true
        serial-port-enable: false
        ssh-keys = "${var.gce_ssh_ansible_user}:${file(var.gce_ssh_pub_key_file_ansible)} \n ${var.gce_ssh_default_user}:${file(var.gce_ssh_pub_key_file_default)}"
    }
    metadata_startup_script = file("./startup/ansible-start-centos.sh")
}

resource "google_compute_instance" "server-3" {
    name = "gcp-server-3-${terraform.workspace}"
    machine_type = "e2-micro"

    shielded_instance_config {
        enable_vtpm = true
        enable_integrity_monitoring = true
    }

    boot_disk {
        initialize_params {
            image = "ubuntu-2004-lts"
        }
    }

        network_interface {
            network = "default"
        }

    metadata = {
        block-project-ssh-keys = false
        enable-oslogin: true
        serial-port-enable: false
        ssh-keys = "${var.gce_ssh_ansible_user}:${file(var.gce_ssh_pub_key_file_ansible)} \n ${var.gce_ssh_default_user}:${file(var.gce_ssh_pub_key_file_default)}"
    }
    
    metadata_startup_script = file("./startup/ansible-start-ubuntu.sh")
}