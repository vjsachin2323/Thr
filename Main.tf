# main.tf
module "hardened_amis" {
  source = "./modules/image-builder"

  # Required parameters
  project_name    = "healthcare-hardened-amis"
  environment     = "prod"
  vpc_id          = var.vpc_id
  subnet_id       = var.subnet_id
  key_pair_name   = var.key_pair_name
  
  # Optional parameters with healthcare defaults
  region                  = var.region
  schedule_expression     = "cron(0 0 ? * SUN *)" # Every Sunday at midnight
  linux_parent_image      = var.linux_parent_image
  windows_parent_image    = var.windows_parent_image
  instance_types          = ["m5.large", "m5.xlarge"]
  allowed_regions         = [var.region]
  
  # Healthcare specific tags
  common_tags = merge(var.common_tags, {
    Department   = "Healthcare"
    Compliance   = "HIPAA"
    DataClass    = "PHI"
    Environment  = "Production"
    ManagedBy    = "Terraform"
    Project      = "Hardened-AMIs"
  })

  # Component overrides
  linux_components = [
    {
      name    = "linux-base-hardening"
      version = "1.0.0"
      data    = file("${path.module}/components/linux-base-hardening.yaml")
    },
    {
      name    = "healthcare-compliance"
      version = "1.0.0"
      data    = file("${path.module}/components/healthcare-compliance.yaml")
    }
  ]

  windows_components = [
    {
      name    = "windows-base-hardening"
      version = "1.0.0"
      data    = file("${path.module}/components/windows-base-hardening.yaml")
    },
    {
      name    = "healthcare-compliance-win"
      version = "1.0.0"
      data    = file("${path.module}/components/healthcare-compliance-win.yaml")
    }
  ]
}

# Output the created AMI IDs for use in other configurations
output "hardened_linux_ami" {
  description = "Latest hardened Linux AMI ID"
  value       = module.hardened_amis.latest_linux_ami_id
}

output "hardened_windows_ami" {
  description = "Latest hardened Windows AMI ID"
  value       = module.hardened_amis.latest_windows_ami_id
}

output "pipeline_status" {
  description = "Status of image pipelines"
  value       = module.hardened_amis.pipeline_status
}
