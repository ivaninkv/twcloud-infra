variable "project_id" {
  description = "Project's ID"
  type        = number
}

variable "cluster_name" {
  description = "Name of cluster"
  type        = string
}

variable "master_cpu" {
  description = "CPU for the server"
  type        = number
  default     = 2
}

variable "master_ram" {
  description = "RAM for the server"
  type        = number
  default     = 2048
}

variable "master_price_min" {
  description = "Master minimal price"
  type        = number
  default     = 1
}

variable "master_price_max" {
  description = "Master max price"
  type        = number
}

variable "high_availability" {
  description = "High availability"
  type        = bool
  default     = false
}

variable "cluster_version" {
  description = "Version of Kubernetes"
  type        = string
  default     = "v1.22.17"
}

variable "network_driver" {
  description = "Network driver"
  type        = string
  default     = "flannel"
}

variable "ingress" {
  description = "Ingress"
  type        = bool
  default     = true
}

variable "node_group_name" {
  description = "Node group name"
  type        = string
}

variable "worker_cpu" {
  description = "Worker CPU"
  type        = number
  default     = 1
}

variable "worker_ram" {
  description = "Worker RAM"
  type        = number
  default     = 1024
}

variable "node_qty" {
  description = "Node quantity"
  type        = number
  default     = 1
}

variable "worker_price_min" {
  description = "Worker minimal price"
  type        = number
  default     = 1
}

variable "worker_price_max" {
  description = "Worker max price"
  type        = number
}
