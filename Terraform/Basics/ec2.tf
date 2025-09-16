# resource "aws_instance" "my_ec2" {
#     ami           = "ami-0360c520857e3138f"
#     instance_type = "t2.micro"
#     }
resource "aws_instance" "my_ec2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  security_groups             = [aws_security_group.MY-SG.id]
  associate_public_ip_address = true
  /* tags = {
    Name      = "Terraform-ec2"
    ENV       = "dev"
    Terraform = "true" # specifying created by terraform code


  } */

  tags = var.tags
}
