region = "us-east-2"

vpc_cidr = "10.0.0.0/16"

public1_cidr = "10.0.1.0/24"
public2_cidr = "10.0.2.0/24"

private1_cidr = "10.0.3.0/24"
private2_cidr = "10.0.4.0/24"

instance_type = "t3.micro"

# Set these from the terminal instead of keeping them in the file:
# export TF_VAR_public_key='ssh-rsa ...'
# export TF_VAR_private_key_path='/root/.ssh/deployer-key'