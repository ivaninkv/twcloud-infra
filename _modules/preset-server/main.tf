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

data "twc_presets" "cheap" {
  location = var.location
  cpu      = var.cpu
  disk     = var.disk

  price_filter {
    from = var.price_min
    to   = var.price_max
  }
}

data "twc_os" "os" {
  name    = var.os_name
  version = var.os_version
}

resource "twc_server" "preset-server" {
  project_id   = var.project_id
  name         = var.server-name
  preset_id    = data.twc_presets.cheap.id
  os_id        = data.twc_os.os.id
  ssh_keys_ids = [var.ssh_key_id]
}
