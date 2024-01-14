provider "aws" {
  region = "us-east-1"  # Replace with your desired region
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.10.10.0/24"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "MyVPC"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.10.10.0/24"
  availability_zone       = "us-east-1a"  # Replace with your desired availability zone
  map_public_ip_on_launch = false

  tags = {
    Name = "PrivateSubnet"
  }
}
