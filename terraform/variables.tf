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
  default = "centos-7-v20221206"  
}

variable "ubuntu" {
  description = "Selecting ubuntu image"
  type = string
  default = "ubuntu-2004-focal-v20230125"
}

### SSH

variable "ssh_user_1" {
  type = string
  default = "lina-infobox"
}

variable "ssh_key_1" {
  type = string
}

variable "ssh_user_2" {
  type = string
  default = "root"
}

variable "ssh_key_2" {
  type = string
}

### SERVICE ACCOUNT

variable "service_acc_email" {
  type = string
  default = "terraform-automation@onyx-osprey-371920.iam.gserviceaccount.com"
}
