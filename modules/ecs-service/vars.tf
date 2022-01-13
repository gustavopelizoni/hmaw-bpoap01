variable "VPC_ID" {
}

variable "AWS_REGION" {
}

variable "APPLICATION_NAME_BPO_SERVICE" {
}

variable "APPLICATION_NAME_BPO_BEAT_CELERY " {
}

variable "APPLICATION_PORT" {
}

variable "APPLICATION_VERSION" {
}

variable "CLUSTER_ARN" {
}

variable "SERVICE_ROLE_ARN" {
  default = "hmaw-bpoap01-rule"
  type = string
}

variable "DESIRED_COUNT" {
}

variable "DEPLOYMENT_MINIMUM_HEALTHY_PERCENT" {
  default = 100
}

variable "DEPLOYMENT_MAXIMUM_PERCENT" {
  default = 200
}

variable "DEREGISTRATION_DELAY" {
  default = 30
}

variable "HEALTHCHECK_MATCHER" {
  default = "200"
}

variable "CPU_RESERVATION" {
}

variable "MEMORY_RESERVATION" {
}

variable "LOG_GROUP" {
}

variable "TASK_ROLE_ARN" {
  default = ""
}

variable "ALB_ARN" {
}

