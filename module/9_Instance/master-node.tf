resource "aws_instance" "controlplane" {
  ami                         = "ami-080e1f13689e07408" #Ubuntu Server 22.04 LTS (HVM)
  instance_type               = "m5.xlarge"
  subnet_id                   = var.pvt_sub1_id
  key_name                    = var.aws_cluster_keypair_id
  associate_public_ip_address = false
  private_ip                  = "10.242.110.5"
  availability_zone           = "us-east-1a"
  vpc_security_group_ids      = [var.master-node_sg_id]
  root_block_device {
    volume_size           = 10
    delete_on_termination = true
    encrypted             = false
    volume_type           = "gp3"
    iops                  = 5000
  }
  ebs_block_device {
    volume_size           = 50
    delete_on_termination = true
    encrypted             = false
    volume_type           = "gp3"
    iops                  = 5000
    device_name           = "/dev/sdb"
  }
  cpu_options {
    core_count       = 2
    threads_per_core = 2
  }
  tags = {
    Name = "master-node",
    OS   = "Ubuntu"
  }
  user_data = <<-EOF
              #!/bin/bash
              exec > /root/cloud-init.out 2>&1
              set -x
              hostnamectl set-hostname master-node
              sudo apt update
              sudo apt upgrade -y
              reboot
              EOF
}