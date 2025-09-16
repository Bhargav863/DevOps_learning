resource "aws_instance" "my_ec2" {
  count                       = 10
  ami                         = var.ami
  instance_type               = var.instance_names[count.index] == "MongoDB" || var.instance_names[count.index] == "MySQL" ? "t3.medium" : "t2.micro"
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.sg_id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.roboshop.key_name
  tags = {
    Name = var.instance_names[count.index]
  }
}

resource "aws_key_pair" "roboshop" {
  key_name   = "roboshop"
  public_key = file("E:/90_days_of_devops/devops.pub")
}

