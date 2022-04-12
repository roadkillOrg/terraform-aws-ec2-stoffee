output "private_ip" {
  description = "Private IP of instance"
  value       = join("", aws_instance.demo.*.private_ip)
}

output "public_ip" {
  description = "Public IP of instance (or EIP)"
  value       = join("", aws_instance.demo.*.public_ip)
}

output "tags" {
  description = "All the tags"
  value       = aws_instance.demo.tags_all
}
