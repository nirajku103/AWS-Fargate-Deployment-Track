

resource "aws_ecr_repository" "service1" {
  name = "service1"
}

resource "aws_ecr_repository" "service2" {
  name = "service2"
}

output "service1_repository_url" {
  value = aws_ecr_repository.service1.repository_url
}

output "service2_repository_url" {
  value = aws_ecr_repository.service2.repository_url
}
