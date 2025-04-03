variable "cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "ami_id" {
  description = "AMI ID for the instances"
  default     = "ami-0866a3c8686eaeeba"  # Replace this with the AMI of your choice
}

variable "instance_type" {
  description = "Instance type for the ASG"
  default     = "t2.micro"
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"  # Replace this if you need another region
}

variable "key_name" {
  description = "Key pair name for SSH access"
  default     = "terraform-key"  # Name of the SSH key pair
}

variable "my_ip" {
  description = "Your public IP address"
  default     = "201.203.117.108/32"  # Replace this with your public IP
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