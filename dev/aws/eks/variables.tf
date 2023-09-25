variable "aws_region" {
  description = "Region for AWS Resources"
  type        = string
  default     = "us-east-1"
}

variable "subnet_ids" {
  description = "Subnet ids where the nodes will be created"
  type = list(string)
  default = ["subnet-049862d616c7ac5d6", "subnet-03484ef47e90dcf76", "subnet-0bec38ce470b596e2"]
}

variable "eks_cluster_name" {
  description = "The EKS cluster name"
  type = string
  default = "eks-cluster"
}

variable "eks_cluster_role_name" {
  description = "The EKS cluster role name"
  type = string
  default = "EKS_Cluster_Role"
}

variable "node_group_name" {
  description = "The name of node group"
  type = string
  default = "eks-node-group"
}

variable "node_group_role_name" {
  description = "The EKS node group role name"
  type = string
  default = "EKS_Node_Group_Role"
}


# Autoscaling group
variable "desired_capacity" {
  description = "The desired node number"
  type = number
  default = 1
}

variable "max_size" {
  description = "The maximum node number"
  type = number
  default = 1
}

variable "min_size" {
  description = "The minimum node number"
  type = number
  default = 1
}