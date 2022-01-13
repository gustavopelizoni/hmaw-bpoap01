## ECS Cluster
module "ecs-hmaw-bpoap01" {
  source         = "github.com/gustavopelizoni/hmaw-bpoap01//modules/ecs-cluster"
  VPC_ID         = "vpc-0d51056d1c87cd1c2"
  CLUSTER_NAME   = "hmaw-bpoap01"
  INSTANCE_TYPE  = "t3a.small"
  SSH_KEY_NAME   = "hmaw-bpoap01"
  VPC_SUBNETS    = "subnet-0751b3e3cc871be8a,subnet-068b41b0ef91dc341"
  ENABLE_SSH     = false
  SSH_SG         = "sg-ecs-hmaw-bpoap01"
  LOG_GROUP      = "log-hmaw-bpoap01"
  AWS_ACCOUNT_ID = "667460020190"
  AWS_REGION     = "us-east-1"
}