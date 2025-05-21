resource "tls_private_key" "rsa-key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "sshkeypair" {
  key_name   = "SSH-key"
  public_key = tls_private_key.rsa-key.public_key_openssh
}

resource "local_file" "ssh-key" {
  content         = tls_private_key.rsa-key.private_key_pem
  filename        = "ssh-key-pair.pem"
  file_permission = "0400"
}