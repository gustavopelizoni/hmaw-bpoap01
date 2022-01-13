## ALB
module "alb-hmaw-bpoap01" {
  source             = "github.com/gustavopelizoni/hmaw-bpoap01//modules/alb"
  VPC_ID             = "vpc-0d51056d1c87cd1c2"
  ALB_NAME           = "alb-hmaw-bpoap01"
  VPC_SUBNETS        = "subnet-0751b3e3cc871be8a,subnet-068b41b0ef91dc341"
  DEFAULT_TARGET_ARN = module.hmaw-bpoap01.target_group_arn
  DOMAIN             = "nave.dev"
  INTERNAL           = false
  ECS_SG             = module.ecs-hmaw-bpoap01.cluster_sg
}

## ALB Rule
module "alb-hmaw-bpoap01-rule" {
  source           = "github.com/gustavopelizoni/hmaw-bpoap01//modules/alb-rule"
  LISTENER_ARN     = module.alb-hmaw-bpoap01.http_listener_arn
  PRIORITY         = 100
  TARGET_GROUP_ARN = module.hmaw-bpoap01.target_group_arn
  #CONDITION_FIELD  = "host-header"
  #CONDITION_VALUES = ["bild.com.br"]
}