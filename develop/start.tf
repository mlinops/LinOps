#The Terraform Google provider is a plugin that allows Terraform to manage resources on Google Cloud Platform. 

provider "google" {
    #credentials = file("gcpx.json")
    project     = "onyx-osprey-371920"
    region      = "us-central1"
    zone     = "us-central1-a"
}

resource "google_service_account" "default" {
    account_id = "terraform-agent" 
    display_name = "terraform-agent"
}

resource "google_compute_instance" "server" {
    name = "gcp-server-1"
    machine_type = "e2-micro"

    shielded_instance_config {
        enable_vtpm = true
        enable_integrity_monitoring = true
    }

    boot_disk {
        initialize_params {
            image = "ubuntu-2204-lts"
        }
    }

        network_interface {
            network = "default"
        }

    metadata = {
        block-project-ssh-keys = true
   }
    
}

# }

# resource "google_compute_instance" "server-2" {
#     name = "gcp-server-2"
#     machine_type = "e2-micro"
#     boot_disk {
#         initialize_params {
#             image = "centos-7-v20200403"
#         }
#     }
#         network_interface {
#             network = "default"
#         }
# }

