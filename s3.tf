
data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "training_documents" {
  bucket = "${var.project_name}-${data.aws_caller_identity.current.account_id}-${var.aws_region}"

  force_destroy = false

  tags = {
    Name    = "${var.project_name}-documents"
    Purpose = "Private training documents"
  }
}

resource "aws_s3_bucket_public_access_block" "training_documents" {
  bucket = aws_s3_bucket.training_documents.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "training_documents" {
  bucket = aws_s3_bucket.training_documents.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "training_documents" {
  bucket = aws_s3_bucket.training_documents.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_ownership_controls" "training_documents" {
  bucket = aws_s3_bucket.training_documents.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "training_documents" {
  bucket = aws_s3_bucket.training_documents.id

  rule {
    id     = "manage-document-versions"
    status = "Enabled"

    filter {}

    noncurrent_version_expiration {
      noncurrent_days = 90
    }

    abort_incomplete_multipart_upload {
      days_after_initiation = 7
    }
  }
}
