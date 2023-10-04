variable "firewall_name" {
  description = "Name of the firewall"
  type        = string
}

variable "firewall_description" {
  description = "Description of the firewall"
  type        = string
}

variable "server_ids" {
  description = "IDs of the servers"
  type        = list(number)
}

variable "firewall_rules" {
  description = "Rules for the firewall"
  type        = map(object({
    direction = string
    port      = number
    protocol  = string
  }))
}
