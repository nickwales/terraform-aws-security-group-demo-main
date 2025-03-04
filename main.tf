terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=3.56"
		}
	}
}

resource "aws_security_group_rule" "group" {
	for_each          = var.services
  type              = "ingress"
  from_port         = each.value.port
  to_port           = each.value.port
  protocol          = "tcp"
  cidr_blocks       = ["${each.value.node_address}/24"]
  #cidr_blocks       = [lookup(each.value.meta, "source", "0.0.0.0/0")]
  description       = "security group rule added by CTS"
  security_group_id = var.security_group_id
}
