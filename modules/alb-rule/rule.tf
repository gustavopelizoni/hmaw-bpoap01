resource "aws_alb_listener_rule" "alb_rule" {
  listener_arn = var.LISTENER_ARN
  priority     = var.PRIORITY

  action {
    type             = "forward"
    target_group_arn = var.TARGET_GROUP_ARN
  }

 #condition {
 #   path_pattern {
 #     values = ["/static/*"]
 #   }
 # }

 # condition {
 #   host_header {
 #     values = ["bild.com.br"]
 #   }
 # }
#}
 
  condition {
    path_pattern  = var.CONDITION_VALUES
  }

condition {
    host_header  = var.CONDITION_FIELD
  }

}