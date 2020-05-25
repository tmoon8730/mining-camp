# Set terraform to save the deployed state to an S3 bucket. This allows
# multiple developers to work off the same state / system
terraform {
  backend "s3" {
    bucket = "nmc-terraform-state"
    key    = "nerdhouse"
    region = "us-east-1"
  }
}