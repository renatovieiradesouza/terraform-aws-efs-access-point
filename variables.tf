variable "file_system_id" {
  description = "ID do sistema de arquivos EFS onde o access point sera criado."
  type        = string
}

variable "name" {
  description = "Nome opcional para adicionar na tag Name do access point."
  type        = string
  default     = null
}

variable "path" {
  description = "Caminho que sera exposto como root directory do access point."
  type        = string
}

variable "owner_uid" {
  description = "UID do owner usado na criacao do diretorio raiz."
  type        = number
}

variable "owner_gid" {
  description = "GID do owner usado na criacao do diretorio raiz."
  type        = number
}

variable "permissions" {
  description = "Permissoes POSIX do diretorio raiz criado no EFS."
  type        = string
  default     = "755"
}

variable "posix_user_uid" {
  description = "UID do usuario POSIX usado pelo access point."
  type        = number
}

variable "posix_user_gid" {
  description = "GID do usuario POSIX usado pelo access point."
  type        = number
}

variable "secondary_gids" {
  description = "Lista opcional de GIDs secundarios para o usuario POSIX."
  type        = list(number)
  default     = []
}

variable "tags" {
  description = "Tags adicionais para aplicar no access point."
  type        = map(string)
  default     = {}
}
