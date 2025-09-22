module "EC2" {
  source        = "./EC2"
  ami_id        = "ami-0360c520857e3138f"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0502cc12711cc7f25"
  name          = "Terraform-ec2"
}
