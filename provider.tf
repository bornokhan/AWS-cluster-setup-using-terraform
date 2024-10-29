#provider "aws" {
#  region                  = "us-east-1"
#  access_key              = "<aws_access_key_id>"
#  secret_key              = "<aws_secret_access_key>"
#}

# Setting up Provider for AWS in this Project
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = "KIA6GBMDZNCJZHK2CUK"
  secret_key = "rHFUhmxKLqthLvJsniubX6EoaFDwTG2vJQCj9G4E"
}