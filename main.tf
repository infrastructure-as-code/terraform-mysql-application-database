################################################################################
# generate random credentials
resource "random_string" "rw_user" {
  length  = 14
  special = false
  number  = false
  upper   = false
  lower   = true
}

resource "random_string" "rw_pass" {
  length  = 128
  special = false
  number  = true
  upper   = true
  lower   = true
}

resource "random_string" "ro_user" {
  length  = 14
  special = false
  number  = false
  upper   = false
  lower   = true
}

resource "random_string" "ro_pass" {
  length  = 128
  special = false
  number  = true
  upper   = true
  lower   = true
}

locals {
  db_rw_user   = "urw${random_string.rw_user.result}"
  db_rw_pass   = "${random_string.rw_pass.result}"
  db_ro_user   = "uro${random_string.ro_user.result}"
  db_ro_pass   = "${random_string.ro_pass.result}"
  db_user_host = "%"
  db_name      = "${var.database_name}"
}

################################################################################
# The ro+rw roles that users inherit from
#locals {
#  db_rw_role = "${local.db_name}_rw_role"
#  db_ro_role = "${local.db_name}_ro_role"
#}
#
#resource "mysql_role" "rw" {
#  name = local.db_rw_role
#}
#
#resource "mysql_role" "ro" {
#  name = local.db_ro_role
#}

resource "mysql_user" "rw" {
  user               = local.db_rw_user
  host               = local.db_user_host
  plaintext_password = local.db_rw_pass
}

resource "mysql_user" "ro" {
  user               = local.db_ro_user
  host               = local.db_user_host
  plaintext_password = local.db_ro_pass
}

################################################################################
resource "mysql_database" "db" {
  name = local.db_name
}

################################################################################
resource "mysql_grant" "rw" {
  user     = mysql_user.rw.user
  host     = mysql_user.rw.host
  database = mysql_database.db.name
  privileges = [
    "ALTER",
    "ALTER ROUTINE",
    "SELECT",
    "UPDATE",
    "DELETE",
    "CREATE",
    "DROP",
  ]
}

resource "mysql_grant" "ro" {
  user     = mysql_user.ro.user
  host     = mysql_user.ro.host
  database = mysql_database.db.name
  privileges = [
    "SELECT",
  ]
}
