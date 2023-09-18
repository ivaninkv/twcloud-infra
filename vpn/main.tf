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

module "ssh" {
  source = "../modules/ssh"
  twc_token = var.twc_token
  key_name = var.ssh_key_name
  key_body = var.ssh_key_body
}

module "wg-server" {
  source = "../modules/software-server"
  twc_token = var.twc_token
  soft_name = var.soft_soft_name
  location = var.soft_location
  cpu = var.soft_cpu
  server_name = var.soft_server_name
  ssh_key_id = module.ssh.key_id
  os_name = var.soft_os_name
  os_version = var.soft_os_version
}

module "test-srv" {
  source = "../modules/preset-server"
  cpu = 1
  ram = 1024
  disk = 15360
  location = "ru-1"
  os_name       = "centos"
  os_version    = "8"
  server-name = "test-srv"
  ssh_key_id  = module.ssh.key_id
  twc_token     = var.twc_token
}
