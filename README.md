# Terraform State

Use this module to setup terraform state with AWS S3 and DynamoDB

```sh
module "example" {
    source          = "git@github.com:woopidi/terraform-state.git"
    account_name    = "example"
}
```

## Example Of Your Component State Configuration

```sh
terraform {
  required_version = "~>0.12.19"

  backend "s3" {
    bucket         = "<example>-terraform-state"
    dynamodb_table = "<example>-terraform-state"
    key            = "terraform/<example>/prod/<component-name>"
    region         = "eu-west-1"
  }
}

provider "aws" {
  region  = "eu-west-1"
  version = "~>2.58"
}

provider "aws" {
  region  = "us-east-1"
  alias   = "virginia"
  version = "~>2.58"
}

```