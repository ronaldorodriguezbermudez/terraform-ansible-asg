module "vpc" {
  source           = "./modules/vpc"
  cidr_block       = "10.0.0.0/16"
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

module "security_group" {
  source  = "./modules/security_group"
  vpc_id  = module.vpc.vpc_id
  my_ip   = "201.203.117.108/32"    # Replace this with your public IP
}

module "asg" {
  source            = "./modules/asg"
  ami_id            = "ami-0866a3c8686eaeeba"  # Replace this with the AMI of your choice
  instance_type     = "t2.micro"
  key_name          = "your-key-pair"  #Replace this with the name of your key pair
  security_group_id = module.security_group.sg_id
  subnet_ids        = module.vpc.subnet_ids
  desired_capacity  = 2
  max_size          = 4
  min_size          = 2
}