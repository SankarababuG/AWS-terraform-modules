##### Ingress Rules

resource "aws_security_group_rule" "ingress_rules" {
  for_each = { for idx, rule in var.ingress_rules : idx => rule }

  # Required attributes
  security_group_id = aws_security_group.sg.id
  type             = "ingress"
  description      = each.value.description
  from_port        = each.value.from_port
  to_port          = each.value.to_port
  protocol         = each.value.protocol
  # Optional attributes with defaults
  cidr_blocks = each.value.cidr_blocks != null ? each.value.cidr_blocks : null
}

##### Egress Rules

resource "aws_security_group_rule" "egress_rules" {
  for_each = { for idx, rule in var.egress_rules : idx => rule }

  # Required attributes
  security_group_id = aws_security_group.sg.id
  type             = "egress"
  description      = each.value.description
  from_port        = each.value.from_port
  to_port          = each.value.to_port
  protocol         = each.value.protocol
  # Optional attributes with defaults
  cidr_blocks = each.value.cidr_blocks != null ? each.value.cidr_blocks : null
}