variable "env" {
  type        = string
  description = "Environment name."
  default     = "prod"
}

variable "project" {
  description = "Project Name or service"
  type        = string
}

variable "owner" {
  description = "Owner Name or service"
  type        = string
}

variable "cost" {
  description = "Center of cost"
  type        = string
}

variable "tf_version" {
  description = "Terraform version that used for the project"
  type        = string
}


######## VPC

variable "availability_zone" {
  description = "Zona de disponibilidad para la nueva subnet privada."
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR block para la nueva subnet privada."
  type        = string
}

variable "route_table_id" {
  description = "ID de la tabla de rutas para la subnet privada."
  type        = string
}


######## EC2 AD
variable "secret-manager-ec2-iis-qa" {
  default = "sm-ec2-iis-qa-password"
}

variable "secret-manager-ec2-iis-prod" {
  default = "sm-ec2-iis-prod-password"
}

variable "secret-manager-ec2-ad" {
  default = "sm-ec2-ad-password"
}

variable "secret-manager-master-ad" {
  default = "sm-master-ad-password"
}

variable "secret-manager-fsx-ad" {
  default = "sm-fsx-ad-password"
}

variable "ad-domain-name" {
  type    = string
  default = "addirectores.cl"
}

# ------------------------
# FSx
# ------------------------
variable "fsx-throughput-capacity" {
  type    = number
  default = 16
}

variable "fsx-throughput-capacity-prod" {
  type    = number
  default = 16
}

variable "fsx-size" {
  type    = number
  default = 550
}

variable "fsx-size-prod" {
  type    = number
  default = 50
}

variable "kms-fsx" {
  type    = string
  default = "arn:aws:kms:us-east-1:065113225941:key/92f642e5-edd9-45cc-8bcb-2efd56e3e634"
}

# ------------------------
# Web Server
# ------------------------

variable "web-instance-type" {
  type    = string
  default = "t3.small"
}

variable "web-instance-type-prod" {
  type    = string
  default = "t3.medium"
}

variable "acm-empleos" {
  type = string
}

variable "acm-directores" {
  type = string
}