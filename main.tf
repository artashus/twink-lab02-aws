terraform {

  required_version = "=0.12.24"

  backend "s3" {
    bucket = "twink-tfstate"
    key    = "twink-common.tfstate"
    region = "us-east-1"
  }

}

provider "aws" {

  region = local.location

}
