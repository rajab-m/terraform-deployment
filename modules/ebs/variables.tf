
variable "ebs_size" {
  type = number
  default = "5"
}

variable "availability_zone" {
  type = string
  
}

# deployment environment
variable "namespace" {
  type = string
  
}

# attachment instance id of the ec2
variable "instance_id" {
  type = string
  
}