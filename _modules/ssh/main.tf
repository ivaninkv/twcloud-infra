terraform {
  required_providers {
    twc = {
      source = "tf.timeweb.cloud/timeweb-cloud/timeweb-cloud"
    }
  }
  required_version = ">= 1.5"
}

resource "twc_ssh_key" "ssh" {
  name = var.key_name
  body = var.key_body
}