provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket         = "tfstate-remote-backend-00004"
    key            = "jupiter/statefile"
    region         = "us-east-2"
    dynamodb_table = "jupiter-state-locking-00004"
    encrypt        = true
  }
}

module "vpc" {
  source             = "./vpc"
  vpc_cidr_block     = var.vpc_cidr_block
  tags               = local.project_tags
  public_cidr_block  = var.public_cidr_block
  private_cidr_block = var.private_cidr_block
  availability_zone  = var.availability_zone
  db_cidr_block      = var.db_cidr_block
}