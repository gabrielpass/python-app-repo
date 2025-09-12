variable "credentials_raw" {
  type        = string
  description = "Conteúdo do JSON da Service Account"
}

variable "project_id" {
  type        = string
  description = "ID do projeto no GCP"
}

variable "region" {
  type        = string
  description = "Região padrão no GCP"
}

variable "github_token" {
  type      = string
  sensitive = true
}

variable "github_owner" {
  type = string
}
