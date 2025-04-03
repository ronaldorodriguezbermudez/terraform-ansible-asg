# Scalable Infrastructure with Terraform and Ansible

## 🚀 Description
This project deploys a scalable infrastructure on AWS using Terraform and Ansible. It includes:
- A VPC with 3 public subnets.
- An Auto Scaling Group (ASG) with NGINX configured on each instance.
- Dynamic instance configuration with Ansible.

## 📦 Requirements
- Terraform >= 1.2.0
- Ansible >= 2.9
- AWS CLI configured
- SSH key for instance access

## 🔑 Generate SSH Keys
Before deploying the infrastructure, you need to generate an SSH key pair to access the instances.

1. Open a terminal and run the following command to generate the keys:
   ```bash
   ssh-keygen -t rsa -b 4096 -f terraform-key
   ```
   - This will generate two files:
     - `terraform-key`: The private key.
     - `terraform-key.pub`: The public key.

2. Ensure the private key has the correct permissions:
   ```bash
   chmod 400 terraform-key
   ```

3. Move both files to the project's root directory (where this `README.md` file is located).

## 🛠️ Deployment Steps

### 1. Configure Terraform
```bash
cd terraform
```
### 2. Initialize the Terraform environment
```bash
terraform init
```

### 3. Apply the configuration to deploy the infrastructure
```bash
terraform apply
```

## 2. Configure Instances with Ansible

1. Navigate to the ansible directory:
```bash
cd ../ansible
```

2. Run the playbook to install and configure NGINX on the instances:
```bash
ansible-playbook playbooks/install_nginx.yml
```

### 3. Validate Deployment
1. Retrieve the public IP addresses of the instances from the AWS console or using Ansible's dynamic inventory:
```bash
ansible-inventory --list
```

2. Access the instances via a browser or use curl to verify that NGINX is properly configured:
```bash
curl http://<public-ip>
```
You should see the message:

"Hello, YOURNAME has deployed this infrastructure!"

## 🔄 Scale the Auto Scaling Group (ASG)

### 1. Modify the `desired_capacity` value in the `main.tf` file:
    desired_capacity = <new_value>

### 2. Apply the changes with Terraform:
```bash
terraform apply -auto-approve
```
### 3. Run the Ansible playbook again to configure the new instances:
```bash
ansible-playbook playbooks/install_nginx.yml
```

## 📚 Validate Scaling

### 1. Check that the new instances are correctly configured:
```bash
ansible all -m ping
```
### 2. Use curl or a browser to confirm that the new instances also display the custom NGINX page.

## 🛡️ Security

### The Security Group allows:

- HTTP access (port 80) from any IP (0.0.0.0/0).
- SSH access (port 22) only from your public IP configured in `main.tf`.

