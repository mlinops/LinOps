# Information about first instance (FI)

output "FI_name" {
  value = google_compute_instance.server_1.name
}

# # Information about second instance (SI)

# output "SI_name" {
#   value = google_compute_instance.server_2.name
# }

# # Information about third instance (TI)

# output "TI_name" {
#   value = google_compute_instance.server_3.name
# }