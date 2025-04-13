
terraform {
  backend "s3" {
    bucket         = "lamda-deployment-bucket-uc"
    key            = "terraform"
    region         = "eu-west-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
