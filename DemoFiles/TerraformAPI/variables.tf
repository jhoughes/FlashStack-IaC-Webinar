variable "purestorage_target" {
  type = string
  description = "This is our target Pure Storage FlashArray."
}
variable "purestorage_apitoken" {
  type = string
  description = "This is the API token for our FlashArray."
}

variable "vol_name" {
  type = string
  description = "This is the name of our volume."
}

variable "vol_size" {
  type = number
  description = "This is the size of our volume."
}

variable "vol_lun_id" {
  type = number
  description = "This is the LUN ID of our volume."
}

variable "host1_name" {
  type = string
  description = "This is the name of our first host."
}

variable "host1_iqn" {
  type = string
  description = "This is the iqn address of our first host."
}

variable "host2_name" {
  type = string
  description = "This is the name of our second host."
}

variable "host2_iqn" {
  type = string
  description = "This is the iqn address of our second host."
}

variable "hostgroup_name" {
  type = string
  description = "This is the name of our host group."
}
