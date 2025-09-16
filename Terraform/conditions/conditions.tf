resource "aws_instance" "my_ec2" {
  ami                         = var.ami
  instance_type               = var.tags.Name == "mongodb" ? "t3.medium" : "t2.micro"
  subnet_id                   = var.subnet_id
  security_groups             = [var.sg_id]
  associate_public_ip_address = true
  tags                        = var.tags
}
