data "aws_availability_zones" "available" {}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.terraform_vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private_db" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = var.private_db_subnet_cidr
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "private-db-subnet"
  }
}

resource "aws_subnet" "private_monitoring" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = var.private_monitoring_subnet_cidr
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "private-monitoring-subnet"
  }
}
