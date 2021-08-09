locals {
  name_prefix = "nw-${var.environment}"
}

variable "environment" {
  description = "the name of the environment being deployed"
  type        = string
}

variable "tags" {
  description = "list of tags to attach to resources"
  type        = map(string)
}

variable "vpc_cidr" {
  description = "cidr block attached to the vpc"
  type        = string
}

variable "vpc_subnet_public_a_cidr" {
  description = "cidr block for public subnet in az-a"
  type        = string
}

variable "vpc_subnet_public_b_cidr" {
  description = "cidr block for public subnet in az-b"
  type        = string
}

variable "vpc_subnet_public_c_cidr" {
  description = "cidr block for public subnet in az-c"
  type        = string
}

variable "vpc_subnet_private_a_cidr" {
  description = "cidr block for private subnet in az-a"
  type        = string
}

variable "vpc_subnet_private_b_cidr" {
  description = "cidr block for private subnet in az-b"
  type        = string
}

variable "vpc_subnet_private_c_cidr" {
  description = "cidr block for private subnet in az-c"
  type        = string
}
