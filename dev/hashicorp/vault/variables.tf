variable "github_org_name" {
  type = string
  description = "The name of your github organization"
  default = "easy-dq"
}

variable "github_path" {
  type = string
  default = "github"
  description = "Path to store github credentials"
}


// PKI

variable "csr_request_type" {
  type = map(string)
  description = "CSR type"
  default = {
    internal  = "internal"
    exported  = "exported"
    kms  = "kms"
  }
}