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

variable "zone" {
  type = string

}

variable "github_token" {
  type      = string
  sensitive = true
}

variable "github_owner" {
  type = string
}

variable "service_account_email" {
  type = string
}

variable "artifact_repo" {
  type = string
}

variable "image_name" {
  type = string
}

variable "image_tag" {
  type = string
}