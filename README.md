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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_efs_access_point.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_access_point) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_file_system_id"></a> [file\_system\_id](#input\_file\_system\_id) | ID do sistema de arquivos EFS onde o access point sera criado. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Nome opcional para adicionar na tag Name do access point. | `string` | `null` | no |
| <a name="input_owner_gid"></a> [owner\_gid](#input\_owner\_gid) | GID do owner usado na criacao do diretorio raiz. | `number` | n/a | yes |
| <a name="input_owner_uid"></a> [owner\_uid](#input\_owner\_uid) | UID do owner usado na criacao do diretorio raiz. | `number` | n/a | yes |
| <a name="input_path"></a> [path](#input\_path) | Caminho que sera exposto como root directory do access point. | `string` | n/a | yes |
| <a name="input_permissions"></a> [permissions](#input\_permissions) | Permissoes POSIX do diretorio raiz criado no EFS. | `string` | `"755"` | no |
| <a name="input_posix_user_gid"></a> [posix\_user\_gid](#input\_posix\_user\_gid) | GID do usuario POSIX usado pelo access point. | `number` | n/a | yes |
| <a name="input_posix_user_uid"></a> [posix\_user\_uid](#input\_posix\_user\_uid) | UID do usuario POSIX usado pelo access point. | `number` | n/a | yes |
| <a name="input_secondary_gids"></a> [secondary\_gids](#input\_secondary\_gids) | Lista opcional de GIDs secundarios para o usuario POSIX. | `list(number)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags adicionais para aplicar no access point. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN do EFS access point. |
| <a name="output_file_system_id"></a> [file\_system\_id](#output\_file\_system\_id) | ID do sistema de arquivos EFS associado ao access point. |
| <a name="output_id"></a> [id](#output\_id) | ID do EFS access point. |
<!-- END_TF_DOCS -->
