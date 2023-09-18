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

data "twc_software" "soft" {
  name = var.soft_name
}

data "twc_os" "os" {
  name = var.os_name
  version = var.os_version
}


data "twc_presets" "cheap" {
  location = var.location
  cpu = var.cpu
}

resource "twc_server" "server" {
  name = var.server_name
  preset_id = data.twc_presets.cheap.id
  os_id = data.twc_os.os.id
  ssh_keys_ids = [var.ssh_key_id]
  software_id = data.twc_software.soft.id
}
