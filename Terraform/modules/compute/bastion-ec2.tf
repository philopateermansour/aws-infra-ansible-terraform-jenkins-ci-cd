resource "aws_instance" "bastion" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  associate_public_ip_address = true
  subnet_id = var.public_subnet_id
  vpc_security_group_ids = [var.bastion_sg]
  key_name = aws_key_pair.sshkeypair.key_name

  tags = {
    Name = var.public_ec2_name
  }
}