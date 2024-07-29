variable "myip" {
  type = string
  default = "203.126.64.67/32"
}

variable "myvpc_id" {
  type = string
}

variable "gbl-tags" {
  type = map(string)
}

variable "addtl-tags" {
  type = map(string)
}

variable "environment_name" {
  type = string
}

variable "knox_id" {
  type = string
}

variable "skillup_bastion_host" {
  type = string
}

variable "skillup_sg_id" {
  type = string
}

variable "private_sg_id" {
  type = string
}

variable "public_sub_1" {
  type = string
}

variable "public_sub_2" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_pair" {
  type = string
}

variable "user_data_bastion" {
  type = string
  default = "modules/alb/user_data/user_data_bastion.sh"
}
