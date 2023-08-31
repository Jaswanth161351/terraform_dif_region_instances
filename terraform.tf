# Define your AWS provider
provider "aws" {
  region = "us-west-2"  # Change this to your default region
}

# Define your instances
resource "aws_instance" "instance1" {
  ami           = "ami-09526fefdbd289f5e"  # Replace with your AMI ID for region 1
  instance_type = "t2.micro"
  tags = {
    Name = "Instance1"
  }
}

provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"  # Change this to your second region
}

resource "aws_instance" "instance2" {
  provider      = aws.us-east-1
  ami           = "ami-094461c34c215edc7"  # Replace with your AMI ID for region 2
  instance_type = "t2.micro"
  tags = {
    Name = "Instance2"
  }
}

provider "aws" {
  alias = "us-east-2"
  region = "us-east-2"  # Change this to your third region
}

resource "aws_instance" "instance3" {
  provider      = aws.us-east-2
  ami           = "ami-0d0549cd616c0a86b"  # Replace with your AMI ID for region 3
  instance_type = "t2.micro"
  tags = {
    Name = "Instance3"
  }
}

