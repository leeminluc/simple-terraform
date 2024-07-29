variable "gbl-tags" {
  type = map(string)
}

variable "environment_name" {
  type = string
}

variable "knox_id" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_1" {
  type = string
}

variable "public_subnet_2" {
  type = string
}

variable "private_subnet_1" {
  type = string
}

variable "private_subnet_2" {
  type = string
}
