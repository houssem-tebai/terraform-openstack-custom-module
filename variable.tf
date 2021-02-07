variable "vm_specs" {
  type = list(object({
    image_name = string
    flavor_name = string
    security_groups = string
  }))
}
variable "network" {
  type    = string
}

variable "volume_size" {
  type    = number
}
variable "lb_specs" {
  type = list(object({
    protocol = string
    lb_method = string
    type = string
  }))
}