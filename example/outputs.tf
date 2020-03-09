output "db1_rw_mysql" {
  value = "MYSQL_PWD=${module.db1.rw_password} mysql --host=${var.mysql_host} --port=${var.mysql_port} --database=${module.db1.database_name} --user=${module.db1.rw_user}"
}

output "db1_ro_mysql" {
  value = "MYSQL_PWD=${module.db1.ro_password} mysql --host=${var.mysql_host} --port=${var.mysql_port} --database=${module.db1.database_name} --user=${module.db1.ro_user}"
}

output "db2_rw_mysql" {
  value = "MYSQL_PWD=${module.db2.rw_password} mysql --host=${var.mysql_host} --port=${var.mysql_port} --database=${module.db2.database_name} --user=${module.db2.rw_user}"
}

output "db2_ro_mysql" {
  value = "MYSQL_PWD=${module.db2.ro_password} mysql --host=${var.mysql_host} --port=${var.mysql_port} --database=${module.db2.database_name} --user=${module.db2.ro_user}"
}
