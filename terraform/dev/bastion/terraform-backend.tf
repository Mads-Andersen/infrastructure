terraform {
  backend "s3" {
    bucket         = "madsandersen-terraform-dev"
    key            = "bastion/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    profile        = "dev"
  }
}