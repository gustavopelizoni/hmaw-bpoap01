#
# target group
#
resource "aws_alb_target_group" "bpo-service-hml" {
  name = "${var.APPLICATION_NAME_BPO_SERVICE}-${substr(
    md5(
      format(
        "%s%s%s",
        var.APPLICATION_PORT,
        var.DEREGISTRATION_DELAY,
        var.HEALTHCHECK_MATCHER,
      ),
    ),
    0,
    12,
  )}"
  port                 = var.APPLICATION_PORT
  protocol             = "HTTP"
  vpc_id               = var.VPC_ID
  deregistration_delay = var.DEREGISTRATION_DELAY

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 3
    protocol            = "HTTP"
    path                = "/"
    interval            = 60
    matcher             = var.HEALTHCHECK_MATCHER
  }
}

resource "aws_alb_target_group" "bpo-rabbitmq-hml" {
  name = "${var.APPLICATION_NAME_BPO_RABBITMQ}-${substr(
    md5(
      format(
        "%s%s%s",
        var.APPLICATION_PORT,
        var.DEREGISTRATION_DELAY,
        var.HEALTHCHECK_MATCHER,
      ),
    ),
    0,
    12,
  )}"
  port                 = var.APPLICATION_PORT
  protocol             = "HTTP"
  vpc_id               = var.VPC_ID
  deregistration_delay = var.DEREGISTRATION_DELAY

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 3
    protocol            = "HTTP"
    path                = "/"
    interval            = 60
    matcher             = var.HEALTHCHECK_MATCHER
  }
}

