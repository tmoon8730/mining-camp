resource "aws_s3_bucket" "minecraft" {
  bucket = var.minecraft["bucket_name"]
  acl    = "private"

  lifecycle_rule {
    id      = "general"
    enabled = true

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }
  }

  lifecycle_rule {
    id      = "backup pruning"
    enabled = true

    tags = {
      backup = "old"
    }

    expiration {
      days = 3
    }
  }
}

# S3 bucket for storing Terraform deployed state
resource "aws_s3_bucket" "terraform" {
  bucket = var.remote_backend
  acl    = "private"

  lifecycle_rule {
    id      = "general"
    enabled = true

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }
  }
}

