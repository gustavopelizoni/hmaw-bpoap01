## ECS Cluster
module "ecs-hmaw-bpoap01" {
  source         = "github.com/gustavopelizoni/hmaw-bpoap01//modules/ecs-cluster"
  VPC_ID         = "vpc-0d51056d1c87cd1c2"
  CLUSTER_NAME   = "hmaw-bpoap01"
  INSTANCE_TYPE  = "t3a.small"
  SSH_KEY_NAME   = "hmaw-bpoap01"
  VPC_SUBNETS    = "subnet-0751b3e3cc871be8a,subnet-068b41b0ef91dc341"
  ENABLE_SSH     = false
  SSH_SG         = "sgecshmawbpoap01"
  LOG_GROUP      = "log-hmaw-bpoap01"
  AWS_ACCOUNT_ID = "667460020190"
  AWS_REGION     = "us-east-1"
}


## ECS Service
module "service-hmaw-bpoap01" {
  source              = "github.com/gustavopelizoni/hmaw-bpoap01//modules/ecs-service"
  VPC_ID              = "vpc-0d51056d1c87cd1c2"
  APPLICATION_NAME    = "hmaw-bpoap01"
  APPLICATION_PORT    = "80"
  APPLICATION_VERSION = "latest"
  CLUSTER_ARN         = module.ecs-hmaw-bpoap01.cluster_arn
  #SERVICE_ROLE_ARN    = module.hmaw-bpoap01-rule
  AWS_REGION          = "us-east-1"
  HEALTHCHECK_MATCHER = "200-399"
  CPU_RESERVATION     = "512"
  MEMORY_RESERVATION  = "512"
  LOG_GROUP           = "log-hmaw-bpoap01"
  DESIRED_COUNT       = 2
  ALB_ARN             = module.hmaw-bpoap01.alb_arn
}
