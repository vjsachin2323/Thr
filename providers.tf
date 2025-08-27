# providers.tf
provider "aws" {
  region = var.region

  default_tags {
    tags = merge(var.common_tags, {
      Environment = "production"
      ManagedBy   = "terraform"
    })
  }
}

provider "random" {}
