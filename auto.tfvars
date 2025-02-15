tf_version = "1.9.7"
project    = "eepp"
owner      = "franco.navarro"
cost       = "0001-civil-eepp"


###### VPC
availability_zone = "us-east-1c"
subnet_cidr       = "10.10.3.0/24"
route_table_id    = "rtb-e8c20e8d" # Reemplaza con tu Route Table para subnets privadas


###### ACM

acm-empleos    = "arn:aws:acm:us-east-1:065113225941:certificate/ce1f658a-b1a5-4406-8ca2-20989ada9c77"
acm-directores = "arn:aws:acm:us-east-1:065113225941:certificate/80156682-4f58-4490-bb97-4114e68c123f"


###### FSX
fsx-throughput-capacity-prod = 128
fsx-size-prod                = 7000
kms-fsx                      = "arn:aws:kms:us-east-1:065113225941:key/92f642e5-edd9-45cc-8bcb-2efd56e3e634"

#####  EC2
web-instance-type-prod = "m7a.xlarge" #"t3a.medium"
