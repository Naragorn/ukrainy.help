resource "aws_s3_bucket" "terraform_state_bucket" {
  #acl    = "private"
  bucket = "ukrainy-help-terraform-state"

  #   server_side_encryption_configuration {
  #     rule {
  #       apply_server_side_encryption_by_default {
  #         #sse_algorithm     = "aws:kms"
  #         sse_algorithm = "aws:sse"
  #         #kms_master_key_id = var.kms_key_id
  #       }
  #     }
  #   }
  #   versioning {
  #     enabled    = true
  #     mfa_delete = false
  #   }

  #tags = merge(var.tags, { Name = var.s3_tf_state_bucket })

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_public_access_block" "terraform_state_bucket_block" {
  bucket = aws_s3_bucket.terraform_state_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  depends_on = [
    aws_s3_bucket.terraform_state_bucket
  ]
}

resource "aws_dynamodb_table" "terraform_lock_state" {
  name         = "terraform-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  server_side_encryption {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}
