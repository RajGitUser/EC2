resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "main-vpc"
    }
}

resource "aws_subnet" "public" {
    vpc_id     = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true
    tags = {
        Name = "public-subnet-1"
    }
}

resource "aws_internet_gateway" "main" {
    vpc_id = aws_vpc.main.id
    tags = {
    Name = "main-igw"
    }
}

# Route table for public subnet
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "my_security_group" {
  name        = "my_security_group"
  description = "Allowing all ports"
  vpc_id      = aws_vpc.main.id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name= "var.my_security_group_tags"
  }
}

resource "aws_security_group_rule" "ssh_allow" {
  type              = "ingress"
  self = true
  security_group_id = aws_security_group.my_security_group.id
  from_port         = 22
  protocol          = "tcp"
  to_port           = 22
}

resource "aws_instance" "workstation" {
    ami  = local.aws_ami
    instance_type = "t3.micro"
    subnet_id = aws_subnet.public.id
    root_block_device {
    volume_size           = 50 # Size in GiB
    volume_type           = "gp3" # or "gp2", "io1", etc.
    delete_on_termination = true
    encrypted             = true
    }
    vpc_security_group_ids = [aws_security_group.my_security_group.id]
    user_data = file("ec2userdata.sh")

    tags = {
        Name = var.instance_tags
    }
}

