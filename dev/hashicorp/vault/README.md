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

- Userpass 
  -  vault auth enable -path=<path> userpass


- vault secrets list 

## Auth methods 

- Token
  - vault token create 
  - vault token revoke <token>

- Userpass 

- Github 
  - vault auth enable github
  - vault write auth/github/config organization=hashicorp
  
- PKI
  -  vault secrets enable pki

- vault auth list