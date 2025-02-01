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
+-----------------+     +-----------------+     +-----------------+
|   Internet      |-----|   Internet      |-----|     VPC         |
|   Gateway (IGW) |     |   Gateway (NAT) |     |  1_VPC          |
|   3_IGW         |     |  4_Nat-Gateway  |     |                 |
+-----------------+     +-----------------+     |  +-----------+  |
                                                |  | Public    |  |  <-- 2_Subnet (for NAT Gateway)
                                                |  | Subnet    |  |
                                                |  +-----------+  |
                                                |  +-----------+  |
                                                |  | Private   |  |  <-- 2_Subnet (for EC2 Instance)
                                                |  | Subnet    |  |
                                                |  +-----------+  |
                                                |  +-----------+  |
                                                |  |  EC2      |  |  <-- 9_Instance
                                                |  | Instance  |  |
                                                |  +-----------+  |
                                                +-----------------+
                                                     |
                                                     | Security Groups (SGs) - 7_SGs applied to subnets/instances
                                                     | Route Table (RT) - 5_RT associated with subnets; 6_subnet-association
                                                     | Key Pair - 8_key-pair associated with EC2 Instance


## Prerequisites
- **AWS Account:**.
- **Terraform Installed:**  Install Terraform on local machine. ([https://www.terraform.io/downloads](https://www.terraform.io/downloads))
- **AWS Credentials Configured:**  Configure your AWS credentials for Terraform to use. Using the AWS CLI or environment variables.
- **Basic Understanding of AWS and Terraform:** Familiarity with AWS concepts and Terraform basics is recommended.
