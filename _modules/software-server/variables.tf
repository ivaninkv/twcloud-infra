variable "soft_name" {
  description = "Name of the software"
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

variable "ssh_key_id" {
  description = "SSH key id"
  type        = number
}

variable "server_name" {
  description = "Name of the server"
  type        = string
}

variable "os_name" {
  description = "OS Name"
  type        = string
}

variable "os_version" {
  description = "Version of OS"
  type        = string
}

variable "project_id" {
  description = "Project's ID"
  type        = number
}

variable "price_min" {
  description = "Minimal price"
  type        = number
  default     = 1
}

variable "price_max" {
  description = "Max price"
  type        = number
}