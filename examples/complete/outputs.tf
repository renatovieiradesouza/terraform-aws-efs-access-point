output "access_point_arn" {
  description = "ARN do access point criado pelo modulo."
  value       = module.efs_access_point.arn
}

output "access_point_id" {
  description = "ID do access point criado pelo modulo."
  value       = module.efs_access_point.id
}

output "file_system_id" {
  description = "ID do sistema de arquivos EFS criado no exemplo."
  value       = aws_efs_file_system.this.id
}
