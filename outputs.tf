output "vpc_id" {
  value = module.networking.vpc_id
}

output "public_subnet_1" {
  value = module.networking.public_subnet_1
}

output "public_subnet_2" {
  value = module.networking.public_subnet_2
}

output "private_subnet_1" {
  value = module.networking.private_subnet_1
}

output "private_subnet_2" {
  value = module.networking.private_subnet_2
}

output "nat_gateway_id" {
  value = module.networking.nat_gateway_id
}

output "internet_gateway_id" {
  value = module.networking.internet_gateway_id
}