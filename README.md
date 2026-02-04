# Provisioning EC2 & Deploying Strapi via Terraform

[![Terraform](https://img.shields.io/badge/Terraform-v1.7.7-blue?logo=terraform&logoColor=white)](https://www.terraform.io/)  
[![AWS](https://img.shields.io/badge/AWS-Amazon%20Linux%202-orange?logo=amazonaws&logoColor=white)](https://aws.amazon.com/)  
[![Strapi](https://img.shields.io/badge/Strapi-v5.35.0-blue?logo=strapi&logoColor=white)](https://strapi.io/)

This repository demonstrates **automated provisioning of an AWS EC2 instance** and deployment of **Strapi CMS** using **Terraform**. It provides a complete setup from EC2 provisioning to Strapi installation and highlights the challenges faced during deployment.

---

## Prerequisites

Before starting, ensure you have:

1. **AWS Account** with Access Key and Secret Key.
2. **Terraform** installed locally (v1.5+ recommended).
3. **SSH Key Pair** for EC2 access.
4. Basic knowledge of Linux commands, Node.js, and Strapi.
5. AWS CLI configured (optional but helpful).

---


---

## Deployment Steps

### 1️ Clone the Repository

```bash
git clone <your-repo-url>
cd terraform-strapi
```
### 2️ Configure AWS Credentials
```hcl
export AWS_ACCESS_KEY_ID="your_access_key"
export AWS_SECRET_ACCESS_KEY="your_secret_key"
```
3️ Initialize Terraform
```
terraform init
```
This downloads the required provider plugins.

---

4️ Preview Changes
```
terraform plan
```
This shows the resources that Terraform will create:

EC2 instance

Security Group (SSH + Strapi port 1337)

User data script for Strapi installation

5️ Apply Terraform
```
terraform apply
```
Type yes to confirm. Terraform will:

Create a Security Group allowing SSH (22) and Strapi (1337).

Launch an EC2 instance.

Execute user_data.sh to:

Update system packages

   Install Git, Curl, Wget

   Install Node.js v20

   Install Yarn globally

Create a Strapi project using SQLite quickstart

🌐 Access Strapi

After deployment:

http://http://13.201.9.171:1337/admin:1337

Follow the Strapi wizard to create an admin account.

###⚠️ Challenges & Solutions
1. Node.js Version Compatibility

Strapi v5 requires Node.js >=20.0.0 <=24.x.x.

Initially, Node.js v18 was installed, causing errors.

Solution: Updated user_data.sh to install Node.js v20.x from NodeSource.

2. EC2 Instance Size

Initially used t3.small.

Issue: Strapi setup failed due to insufficient memory.

Solution: Upgraded to t3.medium (2 vCPU, 4GB RAM), which resolved memory issues.

3. Yarn & npm Global Dependencies

npm version conflicted with Strapi requirements.

Solution: Installed Yarn globally and ensured npm was updated to a compatible version.

4. Protected Packages on Amazon Linux

Attempted removal of curl-minimal caused grub2-efi-x64-ec2 errors.

Solution: Avoid removing essential OS packages; install dependencies with yum install.

5. Security Considerations

SSH (22) should only be open to trusted IPs.

Strapi (1337) can be restricted via firewall or VPC security rules for production.
