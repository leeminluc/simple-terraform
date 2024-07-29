variable "gbl-tags" {
  description = "key-value global tags"
  type = map
  default = {
    GBL_CLASS_0 = "SERVICE"
    GBL_CLASS_1 = "TEST"
  }
}

variable "addtl-tags" {
  description = "key-value additional tags"
  type = map
  default = {
    Owner = "jon.julian"
    Project = "COT-CNF"
    Team = "SRE1"
  }
}

variable "pii-tag" {
  description = "SEC_ASSETS_PII"
  type = map
  default = {
    SEC_ASSETS_PII = "N"
  }
}

variable "public-tag" {
  description = "SEC_ASSETS_PUBLIC"
  type = map
  default = {
    SEC_ASSETS_PUBLIC = "N"
  }
}

variable "knox_id" {
  description = "Knox ID of the owner"
  type = string
  default = "jon.julian"
}

variable "environment_name" {
  description = "Environment name"
  type = string
  default = "skillup"
}

variable "skillup_bastion_host" {
  description = "Public IP of skillup-bastion"
  type = string
  default = "3.138.181.209/32"
}

variable "ami_id" {
  type = string
  default = "ami-00cae939ca4303fd5"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "user_data_webserver" {
  type = string
  default = "user_data/user_data_webserver.sh"
}

variable "key_pair" {
  type = string
  default = "skillup-kp-jon.julian-001"
}

variable "skillup_sg_id" {
  type = string
  default = "sg-0f909df2d7ec0eaf9"
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/19"
}

variable "public_subnet_1" {
  type = string
  default = "10.0.2.0/24"
}

variable "public_subnet_2" {
  type = string
  default = "10.0.3.0/24"
}

variable "private_subnet_1" {
  type = string
  default = "10.0.4.0/24"
}

variable "private_subnet_2" {
  type = string
  default = "10.0.5.0/24"
}
