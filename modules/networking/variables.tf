variable "region" {
  type = string
}


variable "vpc_cidr" {
  type = string
}

variable "public1_cidr" {
  type = string
}

variable "public2_cidr" {
  type = string
}

variable "private1_cidr" {
  type = string
}

variable "private2_cidr" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "public_key" {
  type        = string
  description = "Public key for SSH access"
}

variable "private_key_path" {
  type        = string
  description = "Path to the private key file"
}
