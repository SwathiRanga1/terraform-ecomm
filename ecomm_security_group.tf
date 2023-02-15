# Firewall Rule - Security groups
resource "aws_security_group" "ecomm-ssh-http" {
  name        = "allow_ssh_http"
  description = "Allow ssh and http inbound traffic"
  vpc_id      = aws_vpc.ecomm-vpc.id

# ssh from www
  ingress {
    description      = "ssh from www"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
# http from www
 ingress {
    description      = "http from www"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ecomm-ssh-http"
  }
}