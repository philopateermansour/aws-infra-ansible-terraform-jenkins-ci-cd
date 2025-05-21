resource "aws_instance" "app" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  associate_public_ip_address = false
  subnet_id = var.private_subnet_id
  vpc_security_group_ids = [var.app_sg]
  key_name = aws_key_pair.sshkeypair.key_name


  tags = {
    Name = var.private_ec2_name
  }
}