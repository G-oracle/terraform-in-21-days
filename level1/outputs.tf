output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.public[*].id
}
output "vpc_cidr" {
  value = var.vpc_cidr
}
