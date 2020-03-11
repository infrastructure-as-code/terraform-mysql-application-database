output "db1_rw_mysql" {
  value = module.db1_rw_url.cli_command
}

output "db1_ro_mysql" {
  value = module.db1_ro_url.cli_command
}

output "db2_rw_mysql" {
  value = module.db2_rw_url.cli_command
}

output "db2_ro_mysql" {
  value = module.db2_ro_url.cli_command
}
