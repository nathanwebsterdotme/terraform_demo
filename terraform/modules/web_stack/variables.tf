locals {
  name_prefix = "nw-${var.environment}"
}

variable "environment" {
  description = "the name of the environment being deployed"
  type        = string
}

variable "instance_type" {
  default     = "t2.small"
  description = "default_instance_type"
  type        = string
}
variable "private_subnet_a_id" {
  description = "subnet id for private subnet a"
  type        = string
}
variable "private_subnet_b_id" {
  description = "subnet id for private subnet b"
  type        = string
}

variable "private_subnet_c_id" {
  description = "subnet id for private subnet c"
  type        = string
}

variable "tags" {
  description = "list of tags to attach to resources"
  type        = map(string)
}

variable "vpc_id" {
  description = "vpc id"
  type        = string
}
