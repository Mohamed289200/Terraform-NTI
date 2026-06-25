variable "region" {
  type    = string
  default = "us-east-2"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public1_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "public2_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "private1_cidr" {
  type    = string
  default = "10.0.3.0/24"
}

variable "private2_cidr" {
  type    = string
  default = "10.0.4.0/24"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "public_key" {
  type        = string
  description = "Public key for SSH access"
}

variable "private_key_path" {
  type        = string
  description = "Path to the private key file for SSH"
}