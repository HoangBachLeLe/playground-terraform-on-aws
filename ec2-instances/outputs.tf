output "instance_public_ip" {
  description = "EC2 Public IPv4 address"
  value       = [for instance in aws_instance.web_instance : instance.public_ip]
}

/*
output "instance_public_dns" {
  description = "EC2 Public IPv4 DNS"
  value       = aws_instance.web_instance[*].public_dns
}
*/