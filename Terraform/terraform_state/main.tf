resource "aws_instance" "my_ec2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  tags = {
    Name      = "Terraform-ec2"
    ENV       = "dev"
    Terraform = "true" # specifying created by terraform code


  }
}

resource "aws_dynamodb_table" "terraform-lock" {
  name         = "terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LOCK ID"
  attribute {
    name = "LOCK ID"
    type = "S"
  }
  tags = {
    Name = "terraform-lock"
    ENV  = "production"
  }
}
