output "vpc_id" {
  value = aws_vpc.gabs-vpc.id
}

output "subnet_ids" {
  value = aws_subnet.subnets[*].id
}