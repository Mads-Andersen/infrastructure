provider "aws" {
  region  = "eu-west-1"
  profile = "dev"
}

terraform {
  backend "s3" {
    bucket         = "madsandersen-terraform-dev"
    key            = "github-actions/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    profile        = "dev"
  }
}

data "aws_ami" "debian" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami_value]
  }
  owners = [var.ami_owner]
}

resource "tls_private_key" "this" {
  algorithm = "RSA"
}

module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name   = var.ec2_key_pair_name
  public_key = tls_private_key.this.public_key_openssh
}

resource "aws_instance" "github-actions-runner" {
  ami           = data.aws_ami.debian.id
  instance_type = var.ec2_instance_type
  key_name      = var.ec2_key_pair_name

  tags = var.instance_tags
}

resource "aws_eip" "ip" {
  instance = aws_instance.github-actions-runner.id
  vpc      = true
}