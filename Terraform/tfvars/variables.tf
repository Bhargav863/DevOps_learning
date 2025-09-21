variable "instances" {
  type = map(any)
  default = {
    MongoDB  = "t3.medium"
    MySQL    = "t3.medium"
    Redis    = "t2.micro"
    RabbitMQ = "t2.micro"
    Web      = "t2.micro"
  }
}
variable "subnet_id" {
  type    = string
  default = "subnet-0502cc12711cc7f25"
}

variable "zone_id" {
  default = "Z00027373O2OKHY987PPU"
}
variable "sg_name" {
  default = "allow_all"
}

variable "vpc_id" {
  type    = string
  default = "vpc-0fa0f667d924888bd"
}
variable "sg_cidr" {
  default = ["0.0.0.0/0"]
}
