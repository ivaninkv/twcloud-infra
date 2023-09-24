variable twc_token {
  type        = string
  default     = ""
  description = "Token for timeweb cloud"
  sensitive   = true
}

# project
variable "pr_name" {
  description = "Project name"
  type        = string
}

variable "pr_description" {
  description = "Project description"
  type        = string
}

# SSH
variable "ssh_key_name" {
  description = "Name of the SSH key"
  type        = string
}

variable "ssh_key_body" {
  description = "Public key content for the SSH key"
  type        = string
}
