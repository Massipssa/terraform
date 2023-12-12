- Everything is path-based
- Lease
  - time duration
  - renewability
  - ...
  - vault lease renew, vault lease revoke

## Policies
  - Deny by default 

## Password policies

## Secret Engine

A component which store, generate or encrypt secrets.  

- KV
  - vault kv put secrets/mykey password="fake"
  - vault kv get secrets/mykey

- Userpass
  - vault write userpass/fake password="fake"


- List the enabled secrets engines:  ``vault secrets list``

## Auth methods

- **Token**
  - vault token create
  - vault token revoke <token>

- **Userpass**
  - vault auth enable -path=<path> userpass
  - vault auth disable userpass

- **Github**
  - vault auth enable github
  - vault write auth/github/config organization=hashicorp
  
- **PKI**
  - The PKI secrets engine generates dynamic X.509 certificates. With this secrets engine, services can get certificates
    without going through the usual manual process of generating a private key and CSR, submitting to a CA, and waiting
    for a verification and signing process to complete. (Hashicorp)

  - vault secrets enable pki
  - vault secrets tune -max-lease-ttl=8760h pki

- vault auth list

- Certification Revocation List (CRL):  list of certificates revoked by CA before their expiration.
