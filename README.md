# AWS EFS Access Point Terraform module

Terraform module para criar um `aws_efs_access_point` na AWS com configuracao de usuario POSIX, root directory e tags.

## Usage

```hcl
module "efs_access_point" {
  source = "git::https://github.com/renatovieiradesouza/terraform-aws-efs-access-point.git?ref=v0.1.0"

  file_system_id = "fs-12345678"
  name           = "application"
  path           = "/applications/app1"

  owner_uid   = 1000
  owner_gid   = 1000
  permissions = "755"

  posix_user_uid = 1000
  posix_user_gid = 1000

  secondary_gids = [1001, 1002]

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
```

## Features

- Cria um EFS access point associado a um filesystem existente.
- Configura `posix_user` e `root_directory.creation_info`.
- Permite adicionar tags customizadas, incluindo `Name`.

## Examples

- [`examples/complete`](./examples/complete) - Exemplo completo criando um filesystem EFS e um access point.

## Desenvolvimento

Este repositorio esta preparado para usar `pre-commit` com `terraform fmt`, `terraform validate`, `terraform-docs` e `tflint`.

```bash
pre-commit install
pre-commit run --all-files
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| [terraform](#requirement_terraform) | >= 1.5.7 |
| [aws](#requirement_aws) | >= 5.0 |

## Providers

| Name | Version |
|------|---------|
| [aws](#provider_aws) | >= 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_efs_access_point.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_access_point) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| [file_system_id](#input_file_system_id) | ID do sistema de arquivos EFS onde o access point sera criado. | `string` | n/a | yes |
| [name](#input_name) | Nome opcional para adicionar na tag Name do access point. | `string` | `null` | no |
| [owner_gid](#input_owner_gid) | GID do owner usado na criacao do diretorio raiz. | `number` | n/a | yes |
| [owner_uid](#input_owner_uid) | UID do owner usado na criacao do diretorio raiz. | `number` | n/a | yes |
| [path](#input_path) | Caminho que sera exposto como root directory do access point. | `string` | n/a | yes |
| [permissions](#input_permissions) | Permissoes POSIX do diretorio raiz criado no EFS. | `string` | `"755"` | no |
| [posix_user_gid](#input_posix_user_gid) | GID do usuario POSIX usado pelo access point. | `number` | n/a | yes |
| [posix_user_uid](#input_posix_user_uid) | UID do usuario POSIX usado pelo access point. | `number` | n/a | yes |
| [secondary_gids](#input_secondary_gids) | Lista opcional de GIDs secundarios para o usuario POSIX. | `list(number)` | `[]` | no |
| [tags](#input_tags) | Tags adicionais para aplicar no access point. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| [arn](#output_arn) | ARN do EFS access point. |
| [file_system_id](#output_file_system_id) | ID do sistema de arquivos EFS associado ao access point. |
| [id](#output_id) | ID do EFS access point. |
<!-- END_TF_DOCS -->
