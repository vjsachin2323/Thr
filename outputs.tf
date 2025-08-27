# outputs.tf
output "linux_pipeline_arn" {
  description = "ARN of the Linux hardening pipeline"
  value       = module.hardened_amis.linux_pipeline_arn
}

output "windows_pipeline_arn" {
  description = "ARN of the Windows hardening pipeline"
  value       = module.hardened_amis.windows_pipeline_arn
}

output "latest_linux_ami_id" {
  description = "Latest hardened Linux AMI ID"
  value       = module.hardened_amis.latest_linux_ami_id
}

output "latest_windows_ami_id" {
  description = "Latest hardened Windows AMI ID"
  value       = module.hardened_amis.latest_windows_ami_id
}

output "s3_log_bucket" {
  description = "S3 bucket for Image Builder logs"
  value       = module.hardened_amis.s3_log_bucket
}

output "cloudwatch_log_group" {
  description = "CloudWatch log group for Image Builder"
  value       = module.hardened_amis.cloudwatch_log_group
}

output "infrastructure_configurations" {
  description = "Infrastructure configuration ARNs"
  value       = module.hardened_amis.infrastructure_configurations
}
