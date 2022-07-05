output "id" {
  description = "The ID of the Resource Group"
  value       = local.id
}

output "name" {
  description = "Name of the Resource Group"
  value       = local.name
}

output "location" {
  description = "The Azure Region where the Resource Group should exist"
  value       = local.location
}
