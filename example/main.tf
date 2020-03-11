provider "mysql" {
  endpoint = "${var.mysql_host}:${var.mysql_port}"
  username = var.mysql_user
  password = var.mysql_password
}

################################################################################
module "db1" {
  source        = "./.."
  database_name = "foo"
}

module "db2" {
  source        = "./.."
  database_name = "bar"
}

module "db1_rw_url" {
  source        = "github.com/infrastructure-as-code/terraform-null-database-url?ref=1.0.0"
  database_type = "mysql"
  username      = module.db1.rw_user
  password      = module.db1.rw_password
  hostname      = var.mysql_host
  port          = var.mysql_port
  database_name = module.db1.database_name
}

module "db1_ro_url" {
  source        = "github.com/infrastructure-as-code/terraform-null-database-url?ref=1.0.0"
  database_type = "mysql"
  username      = module.db1.ro_user
  password      = module.db1.ro_password
  hostname      = var.mysql_host
  port          = var.mysql_port
  database_name = module.db1.database_name
}

module "db2_rw_url" {
  source        = "github.com/infrastructure-as-code/terraform-null-database-url?ref=1.0.0"
  database_type = "mysql"
  username      = module.db2.rw_user
  password      = module.db2.rw_password
  hostname      = var.mysql_host
  port          = var.mysql_port
  database_name = module.db2.database_name
}

module "db2_ro_url" {
  source        = "github.com/infrastructure-as-code/terraform-null-database-url?ref=1.0.0"
  database_type = "mysql"
  username      = module.db2.ro_user
  password      = module.db2.ro_password
  hostname      = var.mysql_host
  port          = var.mysql_port
  database_name = module.db2.database_name
}
