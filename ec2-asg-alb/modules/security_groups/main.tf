resource "aws_security_group" "this" {
  name        = var.name
  description = var.description
}

resource "aws_security_group_rule" "this" {
  count = length(var.rules)

  type                     = var.rules[count.index].type
  from_port                = var.rules[count.index].from_port
  to_port                  = var.rules[count.index].to_port
  protocol                 = var.rules[count.index].protocol
  cidr_blocks              = lookup(var.rules[count.index], "cidr_blocks", null)
  source_security_group_id = lookup(var.rules[count.index], "source_security_group_id", null)
  security_group_id        = aws_security_group.this.id
  description              = var.rules[count.index].description
}
