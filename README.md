# MySQL Application Database Terraform Module

## Usage

```
module "db" {
  source = "github.com/infrastructure-as-code/terraform-mysql-application-database"
  database_name = "foo"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| database\_name | Name of database to be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| database\_name | Name of database created |
| ro\_password | read-only user password |
| ro\_user | read-only username |
| rw\_password | read-write user password |
| rw\_user | read-write username |
