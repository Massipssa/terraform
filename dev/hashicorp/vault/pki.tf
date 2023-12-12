// mount the path to store PKIs
resource "vault_mount" "pki" {
  path                      = "pki_test"
  type                      = "pki"
  description = "Test Intermediate CA"
  default_lease_ttl_seconds = 3600
  max_lease_ttl_seconds     = 86400
}

// Set CRL and location of the issuing certificate
resource "vault_pki_secret_backend_config_urls" "config_urls" {
  backend = vault_mount.pki.path
  issuing_certificates = ["http://localhost/v1/pki_int/ca"]
  crl_distribution_points = ["http://localhost/v1/pki_int/crl"]
}

// Generate intermediate Certificate Signing Request (CSR)
resource "vault_pki_secret_backend_intermediate_cert_request" "intermediate_cert_request" {
  backend     = vault_mount.pki.path
  common_name = "myvault.com Intermediate Authority"
  type        = var.csr_request_type.internal
  key_type = "rsa"
  key_bits = 2048
  country = "France"
  province = "Ile De France"
  organization = "test-org"
  ou = "test-ou"
}

// Sing CSR with the Root CA
resource "vault_pki_secret_backend_root_sign_intermediate" "root_sign_intermediate" {
  // The Root CA
  backend     = "pki"
  common_name = "Test"
  csr         = vault_pki_secret_backend_intermediate_cert_request.intermediate_cert_request.csr
}


// Create a role
resource "vault_pki_secret_backend_role" "pki_role" {
  backend = vault_mount.pki.path
  name    = "test_pki_role"
  allowed_domains = ["test.com", "api.test.com"]
  allow_subdomains = true
  max_ttl = "720"
}

// Issue a certificate
resource "vault_pki_secret_backend_intermediate_set_signed" "intermediate_set_signed" {
  backend     = vault_mount.pki.path
  certificate = format("%s\n%s",
    vault_pki_secret_backend_root_sign_intermediate.root_sign_intermediate.certificate,
    vault_pki_secret_backend_root_sign_intermediate.root_sign_intermediate.issuing_ca)
}
