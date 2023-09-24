terraform {
  required_providers {
    twc = {
      source = "tf.timeweb.cloud/timeweb-cloud/timeweb-cloud"
    }
  }
  required_version = ">= 1.5"
}

data "twc_k8s_preset" "preset-master" {
  cpu  = var.master_cpu
  ram  = var.master_ram
  type = "master"

  price_filter {
    from = var.master_price_min
    to   = var.master_price_max
  }
}

resource "twc_k8s_cluster" "cluster" {
  project_id = var.project_id
  name       = var.cluster_name

  high_availability = var.high_availability
  version           = var.cluster_version
  network_driver    = var.network_driver
  ingress           = var.ingress

  preset_id = data.twc_k8s_preset.preset-master.id
}

data "twc_k8s_preset" "preset-worker" {
  cpu  = var.worker_cpu
  ram  = var.worker_ram
  type = "worker"

  price_filter {
    from = var.worker_price_min
    to   = var.worker_price_max
  }
}

resource "twc_k8s_node_group" "example-k8s-node-group" {
  cluster_id = resource.twc_k8s_cluster.cluster.id
  name       = var.node_group_name
  preset_id  = data.twc_k8s_preset.preset-worker.id
  node_count = var.node_qty
}
