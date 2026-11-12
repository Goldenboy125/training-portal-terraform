
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

variable "vpc_cidr" {
  description = "CIDR block for the training portal VPC"
  type        = string
  default     = "10.20.0.0/16"
}

