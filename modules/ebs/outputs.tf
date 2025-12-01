# EBS volume ID
output "ebs_volume_id" {
  description = "The ID of the EBS volume"
  value       = aws_ebs_volume.my-ebs.id
}

# EBS volume size
output "ebs_volume_size" {
  description = "The size of the EBS volume in GB"
  value       = aws_ebs_volume.my-ebs.size
}

# EBS volume AZ
output "ebs_availability_zone" {
  description = "The Availability Zone of the EBS volume"
  value       = aws_ebs_volume.my-ebs.availability_zone
}

# Device name attached to EC2
output "ebs_device_name" {
  description = "The device name used for attaching the EBS volume"
  value       = aws_volume_attachment.ebs_att.device_name
}

# Instance ID to which the volume is attached
output "ebs_attached_instance_id" {
  description = "The EC2 instance ID that this EBS volume is attached to"
  value       = aws_volume_attachment.ebs_att.instance_id
}

