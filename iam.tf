
resource "aws_iam_role" "training_portal_app" {
  name = "${var.project_name}-app-task-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "${var.project_name}-app-task-role"
  }
}

resource "aws_iam_role_policy" "training_portal_s3_access" {
  name = "${var.project_name}-s3-document-access"
  role = aws_iam_role.training_portal_app.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid      = "ListTrainingDocuments"
        Effect   = "Allow"
        Action   = ["s3:ListBucket"]
        Resource = aws_s3_bucket.training_documents.arn

        Condition = {
          StringLike = {
            "s3:prefix" = [
              "documents/",
              "documents/*"
            ]
          }
        }
      },
      {
        Sid    = "UploadAndDownloadDocuments"
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ]
        Resource = "${aws_s3_bucket.training_documents.arn}/documents/*"
      }
    ]
  })
}
