variable "account_name" {}

resource "aws_dynamodb_table" "terraform-state" {
  name            = var.account_name
  read_capacity   = 20
  write_capacity  = 20
  hash_key        = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_s3_bucket" "terraform-state" {
  bucket  = "${var.account_name}-terraform-state"
  acl     = "private"
  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.tfstate.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

resource "aws_kms_key" "tfstate" {
  description             = "This key is used to encrypt tfstate s3 buckets"
  deletion_window_in_days = 10
}
