variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "EC2 Key pair name"
  type        = string
}

variable "public_subnet_id" {
  description = "ID of the public subnet"
  type        = string
}

variable "private_db_subnet_id" {
  description = "ID of the private database subnet"
  type        = string
}

variable "private_monitoring_subnet_id" {
  description = "ID of the private monitoring subnet"
  type        = string
}

variable "public_sg_id" {
  description = "ID of the public security group"
  type        = string
}

variable "private_sg_id" {
  description = "ID of the private security group"
  type        = string
}