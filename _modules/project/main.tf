terraform {
  required_providers {
    twc = {
      source = "tf.timeweb.cloud/timeweb-cloud/timeweb-cloud"
    }
  }
  required_version = ">= 1.1.0"
}

resource "twc_project" "project" {
  name        = var.name
  description = var.description
}