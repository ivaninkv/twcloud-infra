variable twc_token {
  type        = string
  default     = ""
  description = "Token for timeweb cloud"
  sensitive   = true
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

# Software server
variable "soft_soft_name" {
  description = "Name of the software"
  type        = string
}

variable "soft_location" {
  description = "Location for the server, e.g. nl-1, ru-1, ru-2, pl-1, kz-1 ..."
  type        = string
}

variable "soft_cpu" {
  description = "CPU for the server"
  type        = number
}

variable "soft_server_name" {
  description = "Name of the server"
  type        = string
}

variable "soft_os_name" {
  description = "OS Name"
  type        = string
}

variable "soft_os_version" {
  description = "Version of OS"
  type        = string
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

# Firewall
variable "firewall_rules" {
  description = "Rules for the firewall"
  type        = map(object({
    direction = string
    port      = number
    protocol  = string
  }))
}
