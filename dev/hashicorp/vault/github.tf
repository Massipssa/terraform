resource "vault_github_auth_backend" "github_auth" {
  organization = var.github_org_name
  path = var.github_path
}

resource "vault_github_team" "tf_devs" {
  backend  = vault_github_auth_backend.github_auth.id
  team     = "terraform-developers"
  policies = ["developer", "read-only"]
}