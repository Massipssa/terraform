/*
resource "vault_jwt_auth_backend" "oidc" {
  path = "oidc"
  default_role = "test-role"
  //oidc_discovery_url = "fake"
}
*/

resource "vault_jwt_auth_backend_role" "example" {
  backend         = "oidc" //vault_jwt_auth_backend.oidc.path
  role_name       = "test-role"
  token_policies  = ["default", "dev", "prod"]

  user_claim            = "https://vault/user"
  role_type             = "oidc"
  allowed_redirect_uris = ["http://localhost:8200/ui/vault/auth/oidc/oidc/callback"]
}