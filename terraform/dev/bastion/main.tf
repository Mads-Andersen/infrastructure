data "aws_ami" "debian" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami_value]
  }
  owners = [var.ami_owner]
}

resource "aws_key_pair" "my" {
    key_name   = "my_key"
    public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_default_vpc" "default" {}
resource "aws_security_group" "bastion-sg" {
  name   = "bastion-security-group"
  description = "Allow SSH access to bastion host and outbound internet access"
  vpc_id = aws_default_vpc.default.id

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["80.71.142.24/32"]
  }

  egress {
    protocol    = -1
    from_port   = 0 
    to_port     = 0 
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "bastion" {
  ami           = data.aws_ami.debian.id
  instance_type = var.ec2_instance_type
  key_name      = aws_key_pair.my.key_name
  vpc_security_group_ids      = [aws_security_group.bastion-sg.id]
  associate_public_ip_address = true

  tags = var.instance_tags
}

resource "aws_eip" "ip" {
  instance = aws_instance.bastion.id
  vpc      = true
}