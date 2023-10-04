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
  source       = "../_modules/server"
  soft_name    = var.soft_soft_name
  location     = var.soft_location
  cpu          = var.soft_cpu
  server_name  = var.soft_server_name
  ssh_key_id   = module.ssh.key_id
  os_name      = var.soft_os_name
  os_version   = var.soft_os_version
  project_id   = module.project.project_id
  price_max    = 560
  ssh_key_body = file("~/.ssh/id_ed25519")
  #  inline_commands = file("./provisioner.sh")
  depends_on   = [module.project, module.ssh]
}

module "firewall" {
  source               = "../_modules/firewall"
  firewall_name        = "VPN Firewall"
  firewall_description = "Firewall for VPN server"
  server_ids           = [module.wg-server.server_id]
  firewall_rules       = var.firewall_rules
}
