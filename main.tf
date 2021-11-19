provider "aws" {
	region = "us-east-2"
	access_key = "AKIASES435OJHSR5QVZ3"
	secret_key = "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"
}

variable vpc_cidr_block {}
variable subnet_cidr_block {}
variable avail_zone {}


resource "aws_vpc" "myapp-vpc" {
	cidr_block = var.vpc_cidr_block
	tags = {
		Name: var.environmentcidr_blocks[0].name
	}
}

resource "aws_subnet" "myapp-sn-1" {
	vpc_id = aws_vpc.myapp-vpc.id
	cidr_block = var.subnet_cidr_block
	availability_zone = var.avail_zone
	tags = {
		Name: var.cidr_blocks[1].name
	}
}