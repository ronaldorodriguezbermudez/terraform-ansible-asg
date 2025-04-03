output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "subnet_ids" {
  description = "The IDs of the public subnets"
  value       = module.vpc.subnet_ids
}

output "asg_name" {
  description = "The name of the Auto Scaling Group"
  value       = module.asg.asg_name
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = module.security_group.sg_id
}