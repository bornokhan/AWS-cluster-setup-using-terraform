resource "aws_key_pair" "aws_cluster_keypair" {
  key_name   = "aws_cluster_key"
  public_key = file("./ssh/aws_cluster_key.pub")
  #depends_on = [null_resource.generate_ssh_keys]
}