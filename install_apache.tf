resource "aws_instance" "ubuntu_instance" {
  ami           = "ami-0c7217cdde317cfec"  # Replace with your Ubuntu AMI ID
  instance_type = "t2.micro"                # Replace with your instance type
  key_name      = "aws_key_pair.autodeploy.key_name"      # Replace with your key pair name

  subnet_id             = "subnet-0e7aa15edbd6d56ad"           # Replace with your subnet ID
  vpc_security_group_ids = ["sg-0f4f7384e317671fc"] # Replace with your security group ID

  tags = {
    Name = "MyInstance"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y apache2",
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("[4m/Users/admin/.ssh/id_rsa[0m")  # Replace with the path to your private key file
      host        = self.public_ip
    }
  }
}
