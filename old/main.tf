provider "aws" {
	region = "us-east-2"
	access_key = "AKIASES435OJHSR5QVZ3"
	secret_key = "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"
}

variable "subnet_cidr_block" {
	description = "subnet cidr block"
}


variable "vpc_cidr_block" {
	description = "vpc cidr block"
}

variable "environment" {
	description = "environment"
}

resource "aws_vpc" "terraform_test" {
	cidr_block = var.vpc_cidr_block
	tags = {
		Name: var.environment
	}
}

resource "aws_subnet" "test_sn-1" {
	vpc_id = aws_vpc.terraform_test.id
	cidr_block = var.subnet_cidr_block
	availability_zone = "us-east-2a"
	tags = {
		Name: "sn-1-dev"
	}
}

data "aws_vpc" "existing_vpc" {
	default = true
}

resource "aws_subnet" "test_sn-2" {
	vpc_id = data.aws_vpc.existing_vpc.id
	cidr_block = "172.31.48.0/20"
	availability_zone = "us-east-2a"
	tags = {
		Name: "sn-2-default"
	}
}

output "dev-vpc-id" {
	value = aws_vpc.terraform_test.id
}

output "dev-subnet-id" {
	value = aws_subnet.test_sn-1.id
}