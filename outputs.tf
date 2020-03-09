output "rw_user" {
  value       = local.db_rw_user
  description = "read-write username"
}

output "rw_password" {
  value       = local.db_rw_pass
  description = "read-write user password"
}

output "ro_user" {
  value       = local.db_ro_user
  description = "read-only username"
}

output "ro_password" {
  value       = local.db_ro_pass
  description = "read-only user password"
}

output "database_name" {
  value       = local.db_name
  description = "Name of database created"
}
