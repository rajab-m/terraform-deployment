resource "aws_ebs_volume" "my-ebs" {
  availability_zone = var.availability_zone
  size = var.ebs_size

  tags = {
    Name = "${var.namespace}-ebs"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id = aws_ebs_volume.my-ebs.id
  instance_id = var.instance_id
}