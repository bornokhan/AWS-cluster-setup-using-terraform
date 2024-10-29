resource "aws_internet_gateway" "aws_cluster_borno_igw" {
  vpc_id = var.vpc_id
  tags = {
    Name = "aws_cluster_borno_igw"
  }
}