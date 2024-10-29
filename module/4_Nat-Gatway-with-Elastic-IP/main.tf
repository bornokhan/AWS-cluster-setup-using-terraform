resource "aws_eip" "aws_cluster_ngw_eip" {
  domain = "vpc"
  tags = {
    Name = "aws_cluster_ngw_eip"
    Type = "IPV4"
  }
}

resource "aws_nat_gateway" "aws_cluster_ngw" {
  allocation_id = aws_eip.aws_cluster_ngw_eip.id
  subnet_id     = var.pub_sub_id
  tags = {
    Name = "aws_cluster_ngw"
  }
}