# EC2 Instance
resource "aws_instance" "ecomm-web" {
  ami                     = "ami-099effcf516c942b7"
  instance_type           = "t2.micro"
  subnet_id               = aws_subnet.ecomm-subnet-a.id
  key_name                = "lab"
  vpc_security_group_ids  = [aws_security_group.ecomm-ssh-http.id]
  user_data               = file("ecomm.sh")
  tags = {
    Name = "ecomm-web-server"
  }
}
