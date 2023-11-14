terraform {
  required_providers {
    twc = {
      source = "tf.timeweb.cloud/timeweb-cloud/timeweb-cloud"
    }
  }
  required_version = ">= 1.1.0"
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

module "gl-server" {
  source       = "../_modules/server"
  cloud_init   = file("cloud-config.yaml")
  soft_name    = "GitLab"
  location     = "ru-1"
  cpu          = 4
  server_name  = "GitLab srv"
  ssh_key_id   = module.ssh.key_id
  os_name      = "ubuntu"
  os_version   = "22.04"
  project_id   = module.project.project_id
  price_max    = 1200
  ssh_key_body = file("~/.ssh/id_ed25519")
  depends_on   = [module.project, module.ssh]
}

module "k8s" {
  source           = "../_modules/k8s"
  project_id       = module.project.project_id
  cluster_name     = "Learn cluster"
  node_group_name  = "Nodes"
  master_price_max = 200
  worker_price_max = 300
  depends_on       = [module.project]
}
