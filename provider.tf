# Setup our aws provider
provider "aws" {
  region      = var.region
  profile     = var.profile
  # Set version to fix "Error opening a gzip reader for.." error:
  version = "~> 2.44"
}
