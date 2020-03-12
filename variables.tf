variable "database_name" {
  type        = string
  description = "Name of database to be created."
}

variable "rw_privileges" {
  type        = list(string)
  description = "MySQL privileges for read-write user"
  default = [
    "ALL PRIVILEGES",
  ]
}

variable "ro_privileges" {
  type        = list(string)
  description = "MySQL privileges for read-only user"
  default = [
    "SELECT",
  ]
}
