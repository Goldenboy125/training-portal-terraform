output "vpc_id" {
  description = "ID of the training portal VPC"
  value       = aws_vpc.training_portal.id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = aws_subnet.private[*].id
}

output "s3_document_bucket_name" {
  description = "Name of the private training documents bucket"
  value       = aws_s3_bucket.training_documents.bucket
}

output "s3_document_bucket_arn" {
  description = "ARN of the private training documents bucket"
  value       = aws_s3_bucket.training_documents.arn
}

output "app_task_role_arn" {
  description = "IAM role ARN for the training portal application"
  value       = aws_iam_role.training_portal_app.arn
}

output "ecs_execution_role_arn" {
  description = "IAM execution role ARN for ECS tasks"
  value       = aws_iam_role.ecs_execution.arn
}
