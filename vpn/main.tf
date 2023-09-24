terraform {
  required_providers {
    twc = {
      source = "tf.timeweb.cloud/timeweb-cloud/timeweb-cloud"
    }
  }
  required_version = ">= 1.5"
}

provider "twc" {
  token = var.twc_token
}

module "project" {
  source      = "../_modules/project"
  name        = var.pr_name
  description = var.pr_description
}

module "ssh" {
  source   = "../_modules/ssh"
  key_name = var.ssh_key_name
  key_body = var.ssh_key_body
}

module "wg-server" {
  source      = "../_modules/software-server"
  soft_name   = var.soft_soft_name
  location    = var.soft_location
  cpu         = var.soft_cpu
  server_name = var.soft_server_name
  ssh_key_id  = module.ssh.key_id
  os_name     = var.soft_os_name
  os_version  = var.soft_os_version
  project_id  = module.project.project_id
  price_max   = 560
  depends_on  = [module.project, module.ssh]
}
