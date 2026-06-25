terraform {
  backend "s3" {
    bucket = "terraform-state-mohamed-2026"
    key    = "dev/terraform.tfstate"
    region = "us-east-2"
  }
}