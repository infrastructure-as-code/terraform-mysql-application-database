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
