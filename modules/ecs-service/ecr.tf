#
# ECR 
#

resource "aws_ecr_repository" "bpo-service-hml" {
  name = var.APPLICATION_NAME_BPO_SERVICE
}

resource "aws_ecr_repository" "bpo-beat-celery-hml" {
  name = var.APPLICATION_NAME_BPO_BEAT_CELERY
}