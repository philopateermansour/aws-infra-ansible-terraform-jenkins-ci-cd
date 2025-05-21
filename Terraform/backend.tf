terraform {
  backend "s3" {
    bucket       = "ci-cd-terraform-bucket"
    key          = "terraform/state"
    region       = "us-east-1"
    use_lockfile = true
    profile = "admin"
  }
}