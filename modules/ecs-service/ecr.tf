#
# ECR 
#

resource "aws_ecr_repository" "hmaw-bpoap01" {
  name = var.APPLICATION_NAME_BPO_SERVICE
}

resource "aws_ecr_repository" "hmaw-bpoap01-rabbitmq" {
  name = var.APPLICATION_NAME_BPO_BEAT_CELERY
}

