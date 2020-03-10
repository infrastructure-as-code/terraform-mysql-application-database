# MySQL Application Database Terraform Module

MySQL & MariaDB have a robust set of [privileges](https://dev.mysql.com/doc/refman/5.7/en/grant.html) that may be granted to users, but figuring out what privileges are necessary and for who is going to take away time from the application developer.  This module aims to provide an opinionated approach to user management (inspired by [Heroku Postgres](https://www.heroku.com/postgres), and implemented by [JawsDB](https://elements.heroku.com/addons/jawsdb) and [ClearDB](https://elements.heroku.com/addons/cleardb) on Heroku) so that developers can be assured their data is secured from other users on a [multi-tenant](https://en.wikipedia.org/wiki/Multitenancy) database server instance, letting them focus on their applications instead.

## Usage
```
provider "mysql" {
  endpoint = "mysql-host:3306"
  username = "root"
  password = "securepassword"
}

module "db" {
  source = "github.com/infrastructure-as-code/terraform-mysql-application-database"
  database_name = "foo"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| database\_name | Name of database to be created. | `string` | n/a | yes |
| ro\_privileges | MySQL privileges for read-only user | `list(string)` | <pre>[<br>  "SELECT"<br>]</pre> | no |
| rw\_privileges | MySQL privileges for read-write user | `list(string)` | <pre>[<br>  "ALTER",<br>  "ALTER ROUTINE",<br>  "SELECT",<br>  "UPDATE",<br>  "DELETE",<br>  "CREATE",<br>  "DROP"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| database\_name | Name of database created |
| ro\_password | read-only user password |
| ro\_user | read-only username |
| rw\_password | read-write user password |
| rw\_user | read-write username |
