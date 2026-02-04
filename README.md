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

## Project Structure

terraform-strapi/
├── main.tf # EC2, Security Group, Strapi installation
├── variables.tf # Input variables
├── outputs.tf # Terraform outputs
├── provider.tf # AWS provider configuration
└── user_data.sh # EC2 bootstrap script for Strapiv
