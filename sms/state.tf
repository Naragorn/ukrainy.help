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
