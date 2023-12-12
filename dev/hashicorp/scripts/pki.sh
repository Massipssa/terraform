BACKEND_NAME="pki_int"
VAULT_HOST="http://127.0.0.1:8200"

echo "Mount a backend"
vault secrets enable -path=${BACKEND_NAME} pki

echo "Configure an intermediate CA"
vault secrets tune -max-lease-ttl=43800h ${BACKEND_NAME}

echo "Generate intermediate Certificate Signing Request (CSR)"
vault write pki_int/intermediate/generate/internal common_name="myvault.com Intermediate Authority" ttl=43800h

#
vault write pki/root/sign-intermediate csr=@pki_int.csr format=pem_bundle ttl=43800h

echo "Set CRL and location of the issuing certificate"
vault write pki_int/config/urls \
  issuing_certificates="${VAULT_HOST}/v1/pki_int/ca" \
  crl_distribution_points="${VAULT_HOST}/v1/pki_int/crl"

echo "Create a role"
vault write pki_int/roles/example-dot-com \
    allowed_domains=example.com \
    allow_subdomains=true max_ttl=72h

echo "Issue a certificate"
vault write pki_int/issue/example-dot-com common_name=blah.example.com