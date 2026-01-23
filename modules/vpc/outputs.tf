output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.terraform_vpc.id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public.id
}

output "private_db_subnet_id" {
  description = "ID of the private database subnet"
  value       = aws_subnet.private_db.id
}

output "private_monitoring_subnet_id" {
  description = "ID of the private monitoring subnet"
  value       = aws_subnet.private_monitoring.id
}

output "igw_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.igw.id
}

output "nat_gateway_id" {
  description = "ID of the NAT Gateway"
  value       = aws_nat_gateway.nat.id
}