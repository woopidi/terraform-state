terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
}
provider "aws" {
  region  = "eu-west-1"
  #version = "~>2.23.0"
}
