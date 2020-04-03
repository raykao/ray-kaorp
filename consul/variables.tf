variable "resource_group_name" {

}

variable "location" {
  
}

// Required
variable "subnet_id" {

}

// Optional
variable "instances" {
  default = 3
}

variable "vmss_name" {
  default = "consulMasters"
}

variable "vm_sku" {
  default = "Standard_Ds2_v2"
}