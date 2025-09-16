variable "ami" {
  type    = string
  default = "ami-0360c520857e3138f"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "subnet_id" {
  type    = string
  default = "subnet-0502cc12711cc7f25"
}

variable "vpc_id" {
  default = "vpc-0fa0f667d924888bd"
}

variable "sg_cidr" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}

variable "tags" {
  type = map(any)
  default = {
    Name      = "Terraform-ec2"
    ENV       = "dev"
    Terraform = "true" # specifying created by terraform code
  }
}
