output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vpc.id
}

output "public_subnet_ids" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private[*].id
}

output "public_route_table_id" {
  description = "ID of public route table"
  value       = length(aws_route_table.public) > 0 ? aws_route_table.public[*].id : null
}

output "private_route_table_id" {
  description = "ID of private route table"
  value       = length(aws_route_table.private) > 0 ? aws_route_table.private[*].id : null
}

output "nat_gateway_id" {
  description = "ID of the NAT Gateway"
  value       = var.enable_nat_gateway ? aws_nat_gateway.nat[*].id : null
}