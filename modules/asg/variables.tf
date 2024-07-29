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

variable "bastion_sg_id" {
  type = string
}

variable "alb_sg_id" {
  type = string
}

variable "private_sub_1" {
  type = string
}

variable "private_sub_2" {
  type = string
}

variable "tg_arn" {
  type = string
}

variable "s3_endpoint" {
  type = string
}
