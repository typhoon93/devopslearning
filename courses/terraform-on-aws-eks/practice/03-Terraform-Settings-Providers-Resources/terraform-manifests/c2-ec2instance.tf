# Resource: EC2 Instance
resource "aws_instance" "myec2vm" {
  ami           = "ami-04c08fd8aa14af291" // comment 1
  instance_type = "t3.micro"
  user_data = file("${path.module}/app1-install.sh")
  tags = {
    "Name" = "EC2 Demo"
  }
}
