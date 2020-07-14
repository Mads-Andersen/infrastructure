# Input variable definitions

variable "ec2_instance_name" {
  description = "Name of instance"
  type        = string
  default     = "github-actions-runner"
}

variable "ec2_instance_type" {
  description = "Type of instance"
  type        = string
  default     = "t2.micro"
}

variable "ec2_key_pair_name" {
  description = "Name of keypair"
  type        = string
  default     = "github-actions-runner"
}

variable "ami_type" {
  description = "Image type"
  type        = string
  default     = "debian"
}

variable "ami_value" {
  description = "Image value"
  type        = string
  default     = "debian-10-amd64-*"
}

variable "ami_owner" {
  description = "AWS owner id"
  type        = string
  default     = "136693071363"
}

variable "instance_tags" {
  description = "Tags to apply to instance"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
    Name        = "Github-Actions-Runner-01"
    Project     = "Github-Actions-Runner"
  }
}
