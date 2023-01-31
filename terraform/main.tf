# Terraform provider - Google Cloud Platform. 

provider "google" {
    credentials = file("test.json")
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

resource "google_compute_instance" "server_1" {
    name            = "${terraform.workspace}-gcp-server-1"
    machine_type    = var.machine_type

    shielded_instance_config {
        enable_vtpm = true
        enable_integrity_monitoring = false
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
        serial-port-enable: false
        ssh-keys = "${var.gce_ssh_ansible_user}:${file(var.gce_ssh_pub_key_file_ansible)} \n ${var.gce_ssh_default_user}:${file(var.gce_ssh_pub_key_file_default)}"
    }

    metadata_startup_script = file("./startup/${terraform.workspace}/metadata-start-ubuntu.sh")
    
    lifecycle {
        #create_before_destroy = true
        prevent_destroy = false
    }
}

# resource "google_compute_instance" "server_2" {
#     name = "${terraform.workspace}-gcp-server-2"
#     machine_type = var.machine_type

#     shielded_instance_config {
#         enable_vtpm = true
#         enable_integrity_monitoring = true
#     }

#     boot_disk {
#         initialize_params {
#             image = var.centos
#         }
#     }
#         network_interface {
#             network = "default"
#             network_ip = "10.128.0.6"
#         }

#     metadata = {
#         block-project-ssh-keys = false
#         enable-oslogin: true
#         serial-port-enable: false
#         ssh-keys = "${var.gce_ssh_ansible_user}:${file(var.gce_ssh_pub_key_file_ansible)} \n ${var.gce_ssh_default_user}:${file(var.gce_ssh_pub_key_file_default)}"
#     }

#     metadata_startup_script = file("./startup/ansible-start-centos.sh")
    
#     lifecycle {
#         #create_before_destroy = true
#         prevent_destroy = true
#     }
# }

# resource "google_compute_instance" "server_3" {
#     name = "${terraform.workspace}-gcp-server-3"
#     machine_type = var.machine_type

#     shielded_instance_config {
#         enable_vtpm = true
#         enable_integrity_monitoring = true
#     }

#     boot_disk {
#         initialize_params {
#             image = var.ubuntu
#         }
#     }

#         network_interface {
#             network = "default"
#             network_ip = "10.128.0.7"
#         }

#     metadata = {
#         block-project-ssh-keys = false
#         enable-oslogin: true
#         serial-port-enable: false
#         ssh-keys = "${var.gce_ssh_ansible_user}:${file(var.gce_ssh_pub_key_file_ansible)} \n ${var.gce_ssh_default_user}:${file(var.gce_ssh_pub_key_file_default)}"
#     }
    
#     metadata_startup_script = file("./startup/ansible-start-ubuntu.sh")

#     lifecycle {
#         #create_before_destroy = true
#         prevent_destroy = false
#     }
# }

