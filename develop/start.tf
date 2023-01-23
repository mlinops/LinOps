#The Terraform Google provider is a plugin that allows Terraform to manage resources on Google Cloud Platform. 

provider "google" {
    credentials = file("test.json")
    project     = "onyx-osprey-371920"
    region      = "us-central1"
    zone     = "us-central1-a"
}

# resource "google_service_account" "default" {
#     account_id = "terraform-automation" 
#     display_name = "terraform-automation"
# }

resource "google_compute_instance" "server-stable" {
    name = "gcp-server-0"
    machine_type = "e2-small"

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
            network_ip = "10.128.0.10"
        }

    metadata = {
        block-project-ssh-keys = true
    }    

}

// Define VM resources

resource "google_compute_instance" "server" {
    name = "gcp-server-1"
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
            network_ip = "10.128.0.11"
        }

    metadata = {
        block-project-ssh-keys = true
        }

    metadata_startup_script = "curl -fsSL https://raw.githubusercontent.com/linaduko/LinOps/develop/develop/ansible/service/ansible-start-ub.sh -o /tmp/ansible.sh; sudo bash /tmp/ansible.sh"

}



#    service_account {
#      # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
#      email  = google_service_account.default.email
#      scopes = ["cloud-platform"]
#    }


resource "google_compute_instance" "server-2" {
    name = "gcp-server-2"
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
            network_ip = "10.128.0.12"
        }

    metadata = {
        block-project-ssh-keys = true
    }

    metadata_startup_script = "curl -fsSL https://raw.githubusercontent.com/linaduko/LinOps/develop/develop/ansible/service/ansible-start-centos.sh -o /tmp/ansible.sh; sudo bash /tmp/ansible.sh"
}

