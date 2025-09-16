resource "aws_route53_record" "records" {
  count   = 10
  zone_id = var.zone_id
  name    = "${var.instance_names[count.index]}.${var.domain}" #interpolation
  type    = "A"
  ttl     = 1
  records = [aws_instance.my_ec2[count.index].private_ip]
}
