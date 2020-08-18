data "aws_security_group" "default" {
  name   = "${var.name}-${var.environment}-security-group"
  vpc_id = module.vpc.vpc_id
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.name

  cidr = var.cidr

  azs             = var.availability_zones
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_ipv6 = true

  enable_nat_gateway = true
  single_nat_gateway = true

  public_subnet_tags = {
    Name                                = "${var.name}-${var.environment}-public-subnet",
    Environment                         = var.environment,
    "kubernetes.io/cluster/${var.name}" = "shared",
    "kubernetes.io/role/elb"            = "1"
  }

  private_subnet_tags = {
    Name                                = "${var.name}-${var.environment}-private-subnet",
    Environment                         = var.environment,
    "kubernetes.io/cluster/${var.name}" = "shared"
    "kubernetes.io/role/internal-elb"   = "1"
  }

  tags = {
    Owner       = "aicp"
    Environment = "stage"
  }


  vpc_tags = {
    Name                                = "${var.name}-${var.environment}-vpc"
    Environment                         = var.environment
    "kubernetes.io/cluster/${var.name}" = "shared"
  }
}