resource "aws_security_group" "allow_ssh" {
  name        = "secure_ssh"
  description = "Allow SSH from my home IP"
  vpc_id      = aws_vpc.vpc-02ef769587dd081cf.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["73.116.216.200"]  # Replace with your home IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my_sg_tag"
  }
}













