variable twc_token {
  description = "Token for timeweb cloud"
  type        = string
  sensitive   = true
}

variable "server-name" {
  description = "Name of the server"
  type        = string
}

variable "location" {
  description = "Location for the server, e.g. nl-1, ru-1, ru-2, pl-1, kz-1 ..."
  type        = string
}

variable "cpu" {
  description = "CPU for the server"
  type        = number
}


variable "ram" {
  description = "RAM for the server"
  type        = number
}

variable "disk" {
  description = "Disk for the server"
  type        = number
}

variable "ssh_key_id" {
  description = "SSH key id"
  type        = number
}

variable "os_name" {
  description = "OS for the server"
  type        = string
}

variable "os_version" {
  description = "OS version for the server"
  type        = string
}

variable "project_id" {
  description = "Project's ID"
  type        = number
}
