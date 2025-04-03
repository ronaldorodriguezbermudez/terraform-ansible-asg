variable "ami_id" {
  description = "AMI ID for the instances"
}

variable "instance_type" {
  description = "Instance type for the ASG"
  default     = "t2.micro"
}


variable "key_name" {
  description = "Key pair name for SSH access"
}

variable "security_group_id" {
  description = "Security group ID for the instances"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ASG"
}

variable "desired_capacity" {
  description = "Desired number of instances in the ASG"
  default     = 2
}

variable "max_size" {
  description = "Maximum number of instances in the ASG"
  default     = 4
}

variable "min_size" {
  description = "Minimum number of instances in the ASG"
  default     = 2
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}