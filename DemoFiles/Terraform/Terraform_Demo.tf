terraform {
  required_providers {
    flash = {
      source = "devans10/flash"
      version = "1.1.2"
    }
  }
}

provider "flash" {
  username   = "pureuser"
  password   = "pureuser"
  target     = "flasharray1.testdrive.local"
}

resource "purestorage_volume" "vol1" {
  provider = flash
  name = "pure-terraform-datastore"
  size = "21474836480"
}

resource "purestorage_host" "host1" {
  provider = flash
  name = "terraform-esxi-01"
  iqn = ["iqn.1998-01.com.vmware:terraform-esxi-01"]
  personality = "esxi"
}

resource "purestorage_host" "host2" {
  provider = flash
  name = "terraform-esxi-02"
  iqn = ["iqn.1998-01.com.vmware:terraform-esxi-02"]
  personality = "esxi"
}

resource "purestorage_hostgroup" "hostgroup1" {
  provider = flash
  name = "terraform-cluster"
  hosts = ["terraform-esxi-01","terraform-esxi-02"]
  volume {
    vol = "pure-terraform-datastore"
    lun = "250"
  }
  depends_on = [purestorage_host.host1,purestorage_host.host2,purestorage_volume.vol1]
}