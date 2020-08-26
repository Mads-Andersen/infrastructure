# Input variable definitions

variable "ec2_instance_name" {
  description = "Name of instance"
  type        = string
  default     = "bastion"
}

variable "ec2_instance_type" {
  description = "Type of instance"
  type        = string
  default     = "t2.micro"
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
    Name        = "Bastion"
    Project     = "Bastion"
  }
}

variable "allowed_hosts" {
  description = "CIDR blocks of trusted networks"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
