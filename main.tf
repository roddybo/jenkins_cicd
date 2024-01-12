resource "aws_instance" "jenkins_instance" {
  ami           = "ami-0c55b159cbfafe1f0"  # Use your preferred Jenkins AMI
  instance_type = "t2.micro"
  key_name      = "your_key_pair_name"
  
  // Other instance configurations...

  // Attach the primary EBS volume (default size)
  root_block_device {
    volume_size = 8  # Adjust the size based on your needs
  }

  // Attach an additional EBS volume (2 GB)
  ebs_block_device {
    device_name = "/dev/sdb"
    volume_size = 2
    volume_type = "gp2"  # Adjust volume type as needed
  }
}
