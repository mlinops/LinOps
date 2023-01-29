terraform {
  backend "gcs" {
    bucket      = "linops-bucket"
    prefix      = "terraform/state"
  }
}
