#
# ECR 
#

resource "aws_ecr_repository" "hmaw-bpoap01" {
  name = var.APPLICATION_NAME_BPO_SERVICE
}

resource "aws_ecr_repository" "hmaw-bpoap01-rabbitmq" {
  name = var.APPLICATION_NAME_BPO_BEAT_CELERY
}

#
# get latest active revision
#
data "aws_ecs_task_definition" "bpo-service-hml" {
  task_definition = aws_ecs_task_definition.bpo-service-hml-taskdef.family
  depends_on      = [aws_ecs_task_definition.bpo-service-hml-taskdef]
}

#
# task definition template
#

data "template_file" "bpo-service-hml" {
  template = file("${path.module}/bpo-service-hml.json")

  vars = {
    APPLICATION_NAME_BPO_SERVICE    = var.APPLICATION_NAME_BPO_SERVICE
    APPLICATION_PORT    = var.APPLICATION_PORT
    APPLICATION_VERSION = var.APPLICATION_VERSION
    ECR_URL             = aws_ecr_repository.hmaw-bpoap01.repository_url
    AWS_REGION          = var.AWS_REGION
    CPU_RESERVATION     = var.CPU_RESERVATION
    MEMORY_RESERVATION  = var.MEMORY_RESERVATION
    LOG_GROUP           = var.LOG_GROUP
  }
}

#
# task definition
#

resource "aws_ecs_task_definition" "bpo-service-hml-taskdef" {
  family                = var.APPLICATION_NAME_BPO_SERVICE
  container_definitions = data.template_file.bpo-service-hml.rendered
  task_role_arn         = var.TASK_ROLE_ARN
}

#
# ecs service
#

resource "aws_ecs_service" "bpo-service-hml" {
  name    = var.APPLICATION_NAME_BPO_SERVICE
  cluster = var.CLUSTER_ARN
  task_definition = "${aws_ecs_task_definition.bpo-service-hml-taskdef.family}:${max(
    aws_ecs_task_definition.bpo-service-hml-taskdef.revision,
    data.aws_ecs_task_definition.bpo-service-hml.revision,
  )}"
  iam_role                           = var.SERVICE_ROLE_ARN
  desired_count                      = var.DESIRED_COUNT
  deployment_minimum_healthy_percent = var.DEPLOYMENT_MINIMUM_HEALTHY_PERCENT
  deployment_maximum_percent         = var.DEPLOYMENT_MAXIMUM_PERCENT

  load_balancer {
    target_group_arn = aws_alb_target_group.bpo-service-hml.id
    container_name   = var.APPLICATION_NAME_BPO_SERVICE
    container_port   = var.APPLICATION_PORT
  }

  depends_on = [null_resource.alb_exists]
}

resource "null_resource" "alb_exists" {
  triggers = {
    alb_name = var.ALB_ARN
  }
}




