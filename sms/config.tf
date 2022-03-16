provider "aws" {
  region              = "eu-central-1"
  allowed_account_ids = ["902227072526"]
}

terraform {
  backend "s3" {
    region         = "eu-central-1"
    bucket         = "ukrainy-help-terraform-state"
    key            = "state.tfstate"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}

terraform {
  required_version = "1.1.7"
}
