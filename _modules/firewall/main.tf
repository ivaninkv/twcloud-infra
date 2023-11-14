terraform {
  required_providers {
    twc = {
      source = "tf.timeweb.cloud/timeweb-cloud/timeweb-cloud"
    }
  }
  required_version = ">= 1.1.0"
}

resource "twc_firewall" "firewall" {
  name        = var.firewall_name
  description = var.firewall_description

  dynamic "link" {
    for_each = var.server_ids
    content {
      id   = link.value
      type = "server"
    }
  }
}

resource "twc_firewall_rule" "rule" {
  for_each = var.firewall_rules

  firewall_id = twc_firewall.firewall.id
  description = each.key
  direction   = each.value["direction"]
  port        = each.value["port"]
  protocol    = each.value["protocol"]
}