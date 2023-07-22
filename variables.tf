variable "aws_region" {
  description = "AWS region for the resources"
  default     = "us-west-1"
}

variable "aws_secret_key" {
  description = "AWS secret key"
}

variable "aws_access_key" {
  description = "AWS access key"
}

variable "availability_zones_count" {
  type = number
}

variable "ecr_name" {
  type = string
}
