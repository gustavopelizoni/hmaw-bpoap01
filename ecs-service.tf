## ECS Service hmaw-bpoap01
module "bpo-service-hml" {
  #module "hmaw-bpoap01" {

  source = "github.com/gustavopelizoni/hmaw-bpoap01//modules/ecs-service"
  VPC_ID = "vpc-0d51056d1c87cd1c2"
  #APPLICATION_NAME                 = "hmaw-bpoap01"
  APPLICATION_NAME_BPO_SERVICE = "bpo-service-hml"
  #APPLICATION_NAME_BPO_BEAT_CELERY = "bpo-beat-celery-hml"
  #APPLICATION_NAME_BPO_WORKER_CELERY_MAIN  = "bpo-worker-celery-main-hml"
  APPLICATION_NAME_BPO_RABBITMQ            = "bpo-rabbitmq-hml"
  #APPLICATION_NAME_BPO_WORKER_CELERY_POSTS = "bpo-worker-celery-posts-hml"
  APPLICATION_PORT    = "80"
  APPLICATION_VERSION = "latest"
  CLUSTER_ARN         = module.ecs-hmaw-bpoap01.cluster_arn
  SERVICE_ROLE_ARN    = module.ecs-hmaw-bpoap01.service_role_arn
  AWS_REGION          = "us-east-1"
  HEALTHCHECK_MATCHER = "200-399"
  CPU_RESERVATION     = "512"
  MEMORY_RESERVATION  = "512"
  LOG_GROUP           = "log-hmaw-bpoap01"
  DESIRED_COUNT       = 2
  ALB_ARN             = module.alb-hmaw-bpoap01.alb_arn
}

## ECS Service bpo-rabbitmq-hml
module "bpo-rabbitmq-hml" {

  source = "github.com/gustavopelizoni/hmaw-bpoap01//modules/ecs-service"
  VPC_ID = "vpc-0d51056d1c87cd1c2"
  #APPLICATION_NAME    = "hmaw-bpoap01"
  APPLICATION_NAME_BPO_SERVICE = "bpo-service-hml"
  #APPLICATION_NAME_BPO_BEAT_CELERY         = "bpo-beat-celery-hml"
  #APPLICATION_NAME_BPO_WORKER_CELERY_MAIN  = "bpo-worker-celery-main-hml"
  APPLICATION_NAME_BPO_RABBITMQ = "bpo-rabbitmq-hml"
  #APPLICATION_NAME_BPO_WORKER_CELERY_POSTS = "bpo-worker-celery-posts-hml"
  APPLICATION_PORT    = "15672"
  APPLICATION_VERSION = "latest"
  CLUSTER_ARN         = module.ecs-hmaw-bpoap01.cluster_arn
  SERVICE_ROLE_ARN    = module.ecs-hmaw-bpoap01.service_role_arn
  AWS_REGION          = "us-east-1"
  HEALTHCHECK_MATCHER = "200-399"
  CPU_RESERVATION     = "256"
  MEMORY_RESERVATION  = "256"
  LOG_GROUP           = "log-hmaw-bpoap01"
  DESIRED_COUNT       = 2
  ALB_ARN             = module.alb-hmaw-bpoap01.alb_arn
}
