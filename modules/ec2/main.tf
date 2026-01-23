data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "frontend" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  key_name      = var.key_name
  vpc_security_group_ids = [var.public_sg_id]

  tags = {
    Name = "frontend-ec2"
  }
}

resource "aws_instance" "backend" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  key_name      = var.key_name
  vpc_security_group_ids = [var.public_sg_id]

  tags = {
    Name = "backend-ec2"
  }
}

resource "aws_instance" "database" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  subnet_id     = var.private_db_subnet_id
  key_name      = var.key_name
  vpc_security_group_ids = [var.private_sg_id]

  tags = {
    Name = "database-ec2"
  }
}

resource "aws_instance" "monitoring" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  subnet_id     = var.private_monitoring_subnet_id
  key_name      = var.key_name
  vpc_security_group_ids = [var.private_sg_id]

  tags = {
    Name = "monitoring-ec2"
  }
}