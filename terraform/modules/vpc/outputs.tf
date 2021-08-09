output "vpc_id" {
  description = "vpc id"
  value       = aws_vpc.vpc.id
}

output "public_subnet_a_id" {
  description = "id for public subnet a"
  value       = aws_subnet.public_a.id
}

output "public_subnet_b_id" {
  description = "id for public subnet b"
  value       = aws_subnet.public_b.id
}

output "public_subnet_c_id" {
  description = "id for public subnet c"
  value       = aws_subnet.public_c.id
}

output "private_subnet_a_id" {
  description = "id for private subnet a"
  value       = aws_subnet.private_a.id
}

output "private_subnet_b_id" {
  description = "id for private subnet b"
  value       = aws_subnet.private_b.id
}

output "private_subnet_c_id" {
  description = "id for private subnet c"
  value       = aws_subnet.private_c.id
}
