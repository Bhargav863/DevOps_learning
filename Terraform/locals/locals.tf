locals {
  ami = "ami-0360c520857e3138f"
  instance_type = var.isProd ? "t2.micro" : "t3.medium"
  key_public = file("E:/90_days_of_devops/devops.pub")
}