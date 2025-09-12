resource "github_repository" "python_app" {
  name        = "python-app-repo"
  description = "Exemplo: app Python para CI com Cloud Build"
  #private     = false
  visibility = "public"
  auto_init  = false
  has_issues = true
  has_wiki   = false
}


