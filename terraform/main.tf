provider "aws" {
  region = "us-east-1" # Cambia la región si es necesario
}

resource "aws_instance" "fivem_server" {
  ami           = "ami-08c40ec9ead489470" # Ubuntu 20.04 en us-east-1
  instance_type = "t3.medium"
  key_name      = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y docker.io docker-compose
              git clone https://github.com/usuario/fivem-docker.git /home/ubuntu/fivem
              cd /home/ubuntu/fivem && docker-compose up -d
              EOF

  tags = {
    Name = "FiveM-Server"
  }

  security_groups = [aws_security_group.fivem_sg.name]
}

resource "aws_security_group" "fivem_sg" {
  name        = "fivem-sg"
  description = "Seguridad para FiveM Server"

  ingress {
    from_port   = 30120
    to_port     = 30120
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 40120
    to_port     = 40120
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
