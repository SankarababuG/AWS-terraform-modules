##### Security group

resource "aws_security_group" "sg" {
  description = var.sg_description
  name        = var.sg_name
  vpc_id      = var.vpc_id
  tags        = var.sg_tags
}
