output "id" {
  description = "ID do EFS access point."
  value       = aws_efs_access_point.this.id
}

output "arn" {
  description = "ARN do EFS access point."
  value       = aws_efs_access_point.this.arn
}

output "file_system_id" {
  description = "ID do sistema de arquivos EFS associado ao access point."
  value       = aws_efs_access_point.this.file_system_id
}
