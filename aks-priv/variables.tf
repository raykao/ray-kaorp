variable "cluster_name" {
  description = "AKS Cluster Name"
}

variable "location" {
  description = "location of the AKS cluster"
}

variable "resource_group_name" {
  description = "Name of AKS Cluster Resource Group"
}

variable "private_cluster" {
  description = "Boolean - Whether to deploy a private cluster. Default is true"
  default = true
}

variable "vm_size" {
  default = "Standard_D4s_v3"
}

variable "subnet_id" {
  description = "Subnet ID to deploy AKS into"
}

variable "load_balancer_subnet_id" {
  description = "Subnet ID for AKS Load Balancers Subnet"
}

variable "service_cidr" {
  description = "Kubernetes Services network range"
}

variable "docker_bridge_cidr" {
  default = "172.17.0.1/16"
}