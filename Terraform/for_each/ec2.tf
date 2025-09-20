data "aws_security_group" "SG" {
  name = "default"
}

data "aws_ami" "ami_id" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20250821"]
  }
}



resource "aws_instance" "my_ec2" {
  for_each                    = var.instances
  ami                         = data.aws_ami.ami_id.id
  subnet_id                   = var.subnet_id
  security_groups             = [data.aws_security_group.SG.id]
  instance_type               = each.value
  associate_public_ip_address = true
  tags = {
    Name = each.key
  }
}

resource "aws_route53_record" "roboshop" {
  for_each = aws_instance.my_ec2
  zone_id  = var.zone_id
  name     = "${each.key}.devopslearner.space"
  type     = "A"
  ttl      = 1
  records  = [each.key == "Web" ? each.value.public_ip : each.value.private_ip]
}

output "aws_instance_info" {
  value = aws_instance.my_ec2
}
