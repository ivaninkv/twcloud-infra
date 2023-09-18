variable twc_token {
  description = "Token for timeweb cloud"
  type        = string
  sensitive   = true
}

variable "key_name" {
  description = "Name of the SSH key"
  type = string
}

variable "key_body" {
  description = "Public key content for the SSH key"
  type = string
}
