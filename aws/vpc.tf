resource "aws_vpc" "gabs-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${var.prefix}-vpc"
  }
}

data "aws_availability_zones" "available" {}
# output "az" {
#     value = "${data.aws_availability_zones.available.names}"
# }

resource "aws_subnet" "subnets" {
  count = 2
  availability_zone = data.aws_availability_zones.available.names[count.index]
  vpc_id     = aws_vpc.gabs-vpc.id
  cidr_block = "10.0.${count.index}.0/24"
  map_public_ip_on_launch = true
  tags = {
      Name = "${var.prefix}-subnet-${count.index}"
  }
}

resource "aws_internet_gateway" "gabs-igw" {
  vpc_id = aws_vpc.gabs-vpc.id
  tags = {
    Name = "${var.prefix}-igw"
  }  
}

resource "aws_route_table" "gabs-rtb" {
  vpc_id = aws_vpc.gabs-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gabs-igw.id
  }
  tags = {
    Name = "${var.prefix}-rtb"
  }
}

resource "aws_route_table_association" "gabs-rtb-association" {
  count = 2
  route_table_id = aws_route_table.gabs-rtb.id
  subnet_id = aws_subnet.subnets.*.id[count.index]
}