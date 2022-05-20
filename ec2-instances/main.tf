data "aws_ami" "linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "aws_availability_zones" "azs" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

data "aws_ec2_instance_type_offerings" "offerings" {
  for_each = toset(data.aws_availability_zones.azs.names)
  filter {
    name   = "instance-type"
    values = [var.instance_type]
  }
  filter {
    name   = "location"
    values = [each.key]
  }
  location_type = "availability-zone"
}


resource "aws_instance" "web_instance" {
  ami                    = data.aws_ami.linux.id
  instance_type          = var.instance_type
  user_data              = file("${path.module}/user-data.sh")
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  # count             = 2
  # for_each          = toset(data.aws_availability_zones.azs.names)
  # only azs which have ${var.instance_type}
  for_each = toset(keys({ for az, details in data.aws_ec2_instance_type_offerings.offerings :
  az => details.instance_types if length(details.instance_types) != 0 }))
  availability_zone = each.key

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name        = "AZ-${each.key}"
  }
}

resource "aws_security_group" "web_sg" {
  name = "web_sg"

  ingress {
    description = "Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all ip and ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}