terraform {
  required_providers {
    flash = {
      source = "devans10/flash"
      version = "1.1.2"
    }
  }
}

provider "flash" {
  target = var.purestorage_target
  api_token = var.purestorage_apitoken
}

resource "purestorage_volume" "vol1" {
  provider = flash
  name = var.vol_name
  size = var.vol_size
}

resource "purestorage_host" "host1" {
  provider = flash
  name = var.host1_name
  iqn = [var.host1_iqn]
  personality = "esxi"
}

resource "purestorage_host" "host2" {
  provider = flash
  name = var.host2_name
  iqn = [var.host2_iqn]
  personality = "esxi"
}

resource "purestorage_hostgroup" "hostgroup1" {
  provider = flash
  name = var.hostgroup_name
  hosts = [var.host1_name,var.host2_name]
  volume {
    vol = var.vol_name
    lun = var.vol_lun_id
  }
  depends_on = [purestorage_host.host1,purestorage_host.host2,purestorage_volume.vol1]
}