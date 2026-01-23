output "frontend_public_ip" {
  value = module.ec2.frontend_public_ip
}

output "backend_public_ip" {
  value = module.ec2.backend_public_ip
}
