### GOOGLE CREDENTIALS

variable "project_id" {
  description = "The ID of the GCP project in which these resources will be created."
  type = string
  default = "onyx-osprey-371920"
}

### LOCATION

variable "region" {
  description = "The region to launch the Cloud Instance into."
  type        = string
}

variable "zone" {
  description = "The zone to launch the Cloud Instance into."
  type        = string
}

### INSTANCES

variable "machine_type" {
  description = "Selecting type of virtual machine."
  type        = string
}

variable "centos" {
  description = "Selecting centos image"
  type = string
  default = "centos-stream-8-v20221206"  
}

variable "ubuntu" {
  description = "Selecting ubuntu image"
  type = string
  default = "ubuntu-2004-focal-v20230125"
}

###########################################################################

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


