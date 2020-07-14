output "ip" {
  value = aws_eip.ip.public_ip
}

output "keypair_name" {
  value = module.key_pair.this_key_pair_key_name
}

output "keypair_public_openssh" {
  value = tls_private_key.this.public_key_openssh
}

output "keypair_public" {
  value = tls_private_key.this.public_key_pem
}

output "keypair_private" {
  value = tls_private_key.this.private_key_pem
}