# variables.tf
variable "region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "VPC ID for Image Builder infrastructure"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for Image Builder instances"
  type        = string
}

variable "key_pair_name" {
  description = "SSH key pair name for Image Builder instances"
  type        = string
}

variable "linux_parent_image" {
  description = "Parent AMI for Linux hardening"
  type        = string
  default     = "arn:aws:imagebuilder:us-east-1:aws:image/amazon-linux-2-x86/2023.11.12"
}

variable "windows_parent_image" {
  description = "Parent AMI for Windows hardening"
  type        = string
  default     = "arn:aws:imagebuilder:us-east-1:aws:image/windows-server-2022-english-full-base-x86/2023.11.15"
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default     = {
    Project     = "Healthcare-AMI-Hardening"
    CostCenter  = "IT-Infrastructure"
    Owner       = "Infrastructure-Team"
  }
}

variable "enable_cloudwatch_logging" {
  description = "Enable CloudWatch logging for Image Builder"
  type        = bool
  default     = true
}

variable "enable_s3_logging" {
  description = "Enable S3 logging for Image Builder"
  type        = bool
  default     = true
}
