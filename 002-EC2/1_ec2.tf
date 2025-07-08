#### EC2 - Linux

resource "aws_instance" "ec2_db" {
  ami                         = var.ami
  associate_public_ip_address = var.associate_public_ip_address
  availability_zone           = var.availability_zone
  iam_instance_profile = var.iam_instance_profile
  instance_type = var.instance_type
  key_name      = var.key_name
  private_ip    = var.private_ip
  
  root_block_device {
    encrypted = var.root_block_device_encryption
    kms_key_id = var.kms_key_id
    volume_size = var.root_volume_size
  }

  volume_tags            = var.volume_tags
  
  vpc_security_group_ids = [aws_security_group.sg.id]

  subnet_id  = var.subnet_id
  
  tags       = var.ec2_tags
  
  depends_on = [aws_security_group.sg]
}