resource "aws_security_group" "MY-SG" {
  vpc_id = var.vpc_id
  name   = "allow_all"

  ingress {
    description = "Allowing all inbound traffic"
    from_port   = 0 # this is number
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = var.sg_cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" #all protocols
    cidr_blocks = var.sg_cidr
  }
}
