variable "var_name" {
  type = string
  description = "This is description of the variable"
  default = "default-value"

  validation {
    condition = length(var.var_name) > 4 && substr(var.var_name, 0, 4) == "ami-"
    error_message = "This is not valid AMI id"
  }
}

variable "user_information" {
  type = object({
    name = string
    address = string
  })
  # don't show the values in plan or apply commands
  sensitive = true
}

variable "list_var" {
  type = list(string)
  default = ["value-1"]
}