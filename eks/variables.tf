variable "cluster_name" {
  description = "the name of the EKS Cluster"
}


variable "vpc_name" {
  description = "the name of your stack"
}

variable "cidr" {
  description = "The CIDR block for the VPC."
}

variable "public_subnets" {
  type = list(string)
  description = "List of public subnets"
}

variable "private_subnets" {
  type = list(string)
  description = "List of private subnets"
}

variable "availability_zones" {
  type = list(string)
  description = "List of availability zones"
}