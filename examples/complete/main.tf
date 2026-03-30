provider "aws" {
  region = local.region
}

locals {
  name   = "efs-access-point-example"
  region = "us-east-1"
}

resource "aws_efs_file_system" "this" {
  creation_token = local.name
  encrypted      = true

  tags = {
    Name = local.name
  }
}

module "efs_access_point" {
  source = "../../"

  file_system_id = aws_efs_file_system.this.id
  name           = "${local.name}-app"
  path           = "/applications/app1"

  owner_uid   = 1000
  owner_gid   = 1000
  permissions = "755"

  posix_user_uid = 1000
  posix_user_gid = 1000

  secondary_gids = [1001]

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
