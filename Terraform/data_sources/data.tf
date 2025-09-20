data "aws_ami" "ami_id" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20250821"]
  }
}

data "aws_availability_zones" "az" {
  state = "available"

}
output "owner" {
  value = data.aws_ami.ami_id.owners
}

output "ami_id" {
  value = data.aws_ami.ami_id.id
}

output "availability_zones" {
  value = data.aws_availability_zones.az.names
}

