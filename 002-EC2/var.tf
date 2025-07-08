##########
# Variables for data block
##########

variable "vpc_id" {
  description = "ID of the specific VPC to retrieve"
  type        = string
}

variable "subnet_id" {
  description = "ID of the specific VPC Subnet to retrieve"
  type        = string
}

##########
# Variables for EC2 Instance
##########


variable "ami" {
  description = "AMI to use for the instance. Required unless launch_template is specified and the Launch Template specifes an AMI. If an AMI is specified in the Launch Template, setting ami will override the AMI specified in the Launch Template."
  type        = string
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with an instance in a VPC."
  type        = bool
}

variable "availability_zone" {
  description = "AZ to start the instance in"
  type        = string
}

variable "iam_instance_profile" {
  description = "IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile. Ensure your credentials have the correct permission to assign the instance profile according to the EC2 documentation, notably iam:PassRole"
  type = string
}

variable "instance_type" {
  description = "Instance type to use for the instance"
  type        = string
}

variable "key_name" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the aws_key_pair resource"
  type        = string
}

variable "private_ip" {
  description = "Private IP address to associate with the instance in a VPC"
  type        = string
}

variable "root_volume_size" {
  description = "Size of the volume in gibibytes (GiB)"
  type        = string
  default = "8" # Default to 8 GiB if not specified
}

variable "root_block_device_encryption" {
  description = "Whether to enable volume encryption. Defaults to false. Must be configured to perform drift detection."
  type = bool
}

variable "kms_key_id" {
  description = "Amazon Resource Name (ARN) of the KMS Key to use when encrypting the volume. Must be configured to perform drift detection."
  type = string
}


variable "volume_tags" {
  type        = map(any)
  description = "Map of tags to assign, at instance-creation time, to root and EBS volumes"
}

variable "ec2_tags" {
  type        = map(any)
  description = "A mapping of tags"
}

##########
# Variables for security group
##########

variable "sg_description" {
  description = "Security group description. Defaults to Managed by Terraform. Cannot be empty double quotes. NOTE: This field maps to the AWS GroupDescription attribute, for which there is no Update API. If you'd like to classify your security groups in a way that can be updated, use tags"
  type        = string
}

variable "sg_name" {
  description = "Name of the security group. If omitted, Terraform will assign a random, unique name"
  type        = string
}

variable "sg_tags" {
  description = "Map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(any)
}

##########
# Variables for security group rules
##########

variable "ingress_rules" {
  description = "List of inbound rule definitions"
  type = list(object({
    description = string       # Rule description
    from_port   = number       # Starting port
    to_port     = number       # Ending port
    protocol    = string       # Network protocol (tcp, udp, icmp, etc.)
    cidr_blocks = list(string) # Allowed IP ranges       # Whether to allow traffic from same SG
  }))
  default = [] # Default to empty list if no rules provided
}

variable "egress_rules" {
  description = "List of outbound rule definitions"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}
