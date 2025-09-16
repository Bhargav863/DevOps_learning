variable "ami" {
  type    = string
  default = "ami-0360c520857e3138f"
}
variable "subnet_id" {
  type    = string
  default = "subnet-0502cc12711cc7f25"
}

variable "sg_id" {
  default = "sg-000bca96d4eb7e339"
}

variable "instance_names" {
  type    = list(any)
  default = ["MongoDB", "Cart", "Catalogue", "User", "Redis", "MySQL", "RabbitMQ", "Shipping", "Payment", "Web"]
}

variable "zone_id" {
  type    = string
  default = "Z00027373O2OKHY987PPU"
}

variable "domain" {
  default = "devopslearner.space"
}
