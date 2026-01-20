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
  subnet_id     = aws_subnet.public.id
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.public_sg.id]

  tags = {
    Name = "frontend-ec2"
  }
}

resource "aws_instance" "backend" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public.id
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.public_sg.id]

  tags = {
    Name = "backend-ec2"
  }
}

resource "aws_instance" "database" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.private_db.id
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.private_sg.id]

  tags = {
    Name = "database-ec2"
  }
}

resource "aws_instance" "monitoring" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.private_monitoring.id
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.private_sg.id]

  tags = {
    Name = "monitoring-ec2"
  }
}
