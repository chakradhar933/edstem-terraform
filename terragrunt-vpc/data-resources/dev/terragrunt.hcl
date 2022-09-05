terraform {
  source = "tfr:///terraform-aws-modules/vpc/aws?version=3.5.0"
  }
  generate "provider" {
    path = "provider.tf"
      if_exists = "overwrite_terragrunt"
        contents = <<EOF
	provider "aws" {
	  region = "us-east-2"
	  }
	  EOF
	  }
inputs = {
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

    name = "my-vpc"
      cidr = "192.168.0.0/16"

        azs             = ["us-east-2a","us-east-2b","us-east-2c"]
	  private_subnets = ["192.168.3.0/24","192.168.4.0/24","192.168.3.0/24"]
	    public_subnets  = ["192.168.1.0/24","192.168.2.0/24","192.168.3.0/24"]

	      enable_nat_gateway = true
	        enable_vpn_gateway = true

		  tags = {
		      Terraform = "true"
		          Environment = "dev"
			    }
			    }
			    }
