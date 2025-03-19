
terraform {
  backend "s3" {
    bucket         = "devops-hackathon"
    key            = "terraform"
    region         = "us-east-1"
    encrypt        = true
  }
}
