resource "aws_instance" "my_ec2" {
  ami                         = local.ami
  instance_type               = local.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.sg_id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.roboshop.key_name
}

resource "aws_key_pair" "roboshop" {
  key_name   = "roboshop"
  public_key = local.key_public
}
