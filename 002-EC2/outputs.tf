#### Outputs
output "instance_id" {
  description = "value"
  value = aws_instance.ec2_db.id
}

output "public_ip" {
  description = ""
  value = aws_instance.ec2_db.public_ip
}

output "security_group_id" {
  description = ""
  value = aws_security_group.sg.id
}