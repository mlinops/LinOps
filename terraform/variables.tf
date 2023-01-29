### PROJECT

### BUCKET

### SSH

variable "gce_ssh_ansible_user" {
  type = string
  default = "root"
}

variable "gce_ssh_default_user" {
  type = string
  default = "lina_infobox"
}

variable "gce_ssh_pub_key_file_default" {
  type = string
  default = "id_rsa_default.pub"
}

variable "gce_ssh_pub_key_file_ansible" {
  type = string
  default = "id_rsa_ansible.pub"
}
