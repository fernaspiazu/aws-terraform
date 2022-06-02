resource "aws_security_group" "dummy_instance_sg" {
  name   = "dummy-sg"
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
}

resource "aws_security_group_rule" "egress_allow_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.dummy_instance_sg.id
}

resource "aws_security_group_rule" "allow_http_access" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["93.34.120.70/32"]
  security_group_id = aws_security_group.dummy_instance_sg.id
}


resource "aws_instance" "dummy_instance" {
  ami                    = var.ami_amzn_linux_2
  instance_type          = "t2.micro"
  subnet_id              = data.terraform_remote_state.vpc.outputs.public_subnet_id
  vpc_security_group_ids = [aws_security_group.dummy_instance_sg.id]
  user_data              = file("${path.module}/user_data/run.sh")

  tags = {
    "Name" = "Dummy Instance Example"
  }
}