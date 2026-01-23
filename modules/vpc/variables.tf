variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_db_subnet_cidr" {
  description = "CIDR block for the private database subnet"
  type        = string
}

variable "private_monitoring_subnet_cidr" {
  description = "CIDR block for the private monitoring subnet"
  type        = string
}