# Terraform provider - Google Cloud Platform. 

provider "google" {
    project     = var.project_id
    region      = var.region
    zone        = var.zone
}

terraform {
  backend "gcs" {
    bucket      = "linops-bucket"
    prefix      = "terraform"
  }
}

# ifsec:ignore:google-compute-no-project-wide-ssh-keys ifsec:ignore:google-compute-vm-disk-encryption-customer-key
resource "google_compute_instance" "server_1" {
    name            = "${terraform.workspace}-gcp-server-1"
    machine_type    = var.machine_type
    allow_stopping_for_update = true
    
    scheduling {
    automatic_restart = true
    }

    shielded_instance_config {
        enable_vtpm = true
        enable_integrity_monitoring = true
    }
 
    boot_disk {
        initialize_params {
            image = var.ubuntu
        }
    }

    network_interface {
        network = "default"
    }
    
    metadata = {
        block-project-ssh-keys = false
        enable-oslogin: true
        serial-port-enable: true
        ssh-keys = "${var.ssh_user_1}:${var.ssh_key_1} \n ${var.ssh_user_2}:${var.ssh_key_2}"
    }

    metadata_startup_script = file("./startup/${terraform.workspace}/metadata-ubuntu.sh")

    lifecycle {
        create_before_destroy = true
        #prevent_destroy = false
    }

    service_account {
    email = var.service_acc_email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}

# ifsec:ignore:google-compute-no-project-wide-ssh-keys ifsec:ignore:google-compute-vm-disk-encryption-customer-key
resource "google_compute_instance" "server_2" {
    name = "${terraform.workspace}-gcp-server-2"
    machine_type = var.machine_type
    allow_stopping_for_update = true

    scheduling {
    automatic_restart = true
    }

    shielded_instance_config {
        enable_vtpm = true
        enable_integrity_monitoring = true
    }

    boot_disk {
        initialize_params {
            image = var.centos
        }
    }
        network_interface {
            network = "default"
        }

    metadata = {
        block-project-ssh-keys = false
        enable-oslogin: true
        serial-port-enable: true
        ssh-keys = "${var.ssh_user_1}:${var.ssh_key_1} \n ${var.ssh_user_2}:${var.ssh_key_2}"
    }

    metadata_startup_script = file("./startup/${terraform.workspace}/metadata-centos.sh")
    
    lifecycle {
        create_before_destroy = true
        #prevent_destroy = true
    }

    service_account {
    email = var.service_acc_email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}

# ifsec:ignore:google-compute-no-project-wide-ssh-keys ifsec:ignore:google-compute-vm-disk-encryption-customer-key
resource "google_compute_instance" "server_3" {
    name = "${terraform.workspace}-gcp-server-3"
    machine_type = var.machine_type
    allow_stopping_for_update = true

    scheduling {
    automatic_restart = true
    }

    shielded_instance_config {
        enable_vtpm = true
        enable_integrity_monitoring = true
    }

    boot_disk {
        initialize_params {
            image = var.ubuntu
        }
    }

        network_interface {
            network = "default"
        }

    metadata = {
        block-project-ssh-keys = false
        enable-oslogin: true
        serial-port-enable: true
        ssh-keys = "${var.ssh_user_1}:${var.ssh_key_1} \n ${var.ssh_user_2}:${var.ssh_key_2}"
    }
    
    metadata_startup_script = file("./startup/${terraform.workspace}/metadata-ubuntu.sh")

    lifecycle {
        create_before_destroy = true
        #prevent_destroy = false
    }

    service_account {
    email = var.service_acc_email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}

