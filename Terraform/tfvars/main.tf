terraform {
  backend "s3" {}
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
  ami                         = data.aws_ami.ami_id.id
  for_each                    = var.instances
  instance_type               = each.value
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  tags = {
    Name = each.key
  }
}

resource "aws_route53_record" "www" {
  for_each = aws_instance.my_ec2
  zone_id  = var.zone_id
  name     = "${each.key}.devopslearner.space"
  type     = "A"
  ttl      = 1
  records  = [each.key == "Web_Dev" ? each.value.public_ip : each.value.private_ip]
}

resource "aws_security_group" "my_sg" {
  name   = var.sg_name
  vpc_id = var.vpc_id

  ingress {
    description = "allowing all inbound traffic"
    to_port     = 0
    from_port   = 0
    protocol    = "TCP"
    cidr_blocks = var.sg_cidr
  }

  egress {
    to_port     = 0
    from_port   = 0
    protocol    = "-1"
    cidr_blocks = var.sg_cidr
  }
}
