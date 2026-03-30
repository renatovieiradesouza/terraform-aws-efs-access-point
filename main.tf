resource "aws_efs_access_point" "this" {
  file_system_id = var.file_system_id

  posix_user {
    uid            = var.posix_user_uid
    gid            = var.posix_user_gid
    secondary_gids = var.secondary_gids
  }

  root_directory {
    path = var.path

    creation_info {
      owner_uid   = var.owner_uid
      owner_gid   = var.owner_gid
      permissions = var.permissions
    }
  }

  tags = merge(var.tags, var.name != null ? { Name = var.name } : {})
}
