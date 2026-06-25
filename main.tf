module "networking" {

  source = "./modules/networking"

  vpc_cidr         = var.vpc_cidr
  public1_cidr     = var.public1_cidr
  public2_cidr     = var.public2_cidr
  private1_cidr    = var.private1_cidr
  private2_cidr    = var.private2_cidr
  public_key       = var.public_key
  private_key_path = var.private_key_path
}