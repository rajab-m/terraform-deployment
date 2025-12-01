#ip of public instance
output "public_ip" {
  value = aws_instance.ec2_public.public_ip
}

output "ec2_az" {
  value = aws_instance.ec2_public.availability_zone
}

output "instance_id" {
  value = aws_instance.ec2_public.id
}

output "public_dns" {
  description = "The public DNS name"
  value       = aws_instance.ec2_public.public_dns
}



