This project defines and deploys an AWS infrastructure cluster using Terraform. It includes essential components for a robust and scalable setup, such as VPC, Subnets, Internet Gateway, NAT Gateway, Route Table, Security Groups, Key Pair, and an EC2 Instance.


## Overview
This project utilizes Terraform to automate the creation and management of an AWS infrastructure cluster. It provides a modular and repeatable way to deploy resources, ensuring consistency and reducing manual effort.
The infrastructure includes the following components:
- **VPC (Virtual Private Cloud):**  A logically isolated section of the AWS Cloud where your resources reside.
- **Subnets:**  Subdivisions of the VPC for better organization and security.
- **Internet Gateway (IGW):** Enables communication between your VPC and the internet.
- **NAT Gateway:** Allows instances in private subnets to connect to the internet without exposing their public IP addresses.
- **Route Table (RT):**  Directs network traffic within the VPC and to the internet.
- **Security Groups (SGs):**  Act as virtual firewalls to control inbound and outbound traffic for your instances.
- **Key Pair:**  Used for secure SSH access to your EC2 instances.
- **EC2 Instance:**  A virtual server in the AWS cloud.

## Architecture
![image](https://github.com/user-attachments/assets/e86737bc-247b-48d9-93b0-0605ed17f78c)



## Prerequisites
- **AWS Account:**.
- **Terraform Installed:**  Install Terraform on local machine. ([https://www.terraform.io/downloads](https://www.terraform.io/downloads))
- **AWS Credentials Configured:**  Configure your AWS credentials for Terraform to use. Using the AWS CLI or environment variables.
- **Basic Understanding of AWS and Terraform:** Familiarity with AWS concepts and Terraform basics is recommended.
