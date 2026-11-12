variable "aws_region" {
  description = "AWS deployment region"
  type        = string
  default     = "eu-north-1"
}

variable "aws_profile" {
  description = "AWS CLI profile"
  type        = string
  default     = "startup-challenge"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "training-portal"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "learning"
}
