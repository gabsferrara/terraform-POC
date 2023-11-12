module "new-vpc" {
    source = "./modules/vpc"
    prefix = var.prefix
    vpc_cidr_block = var.vpc_cidr_block
}

module "eks" {
    source = "./modules/eks"
    vpc_id = module.new-vpc.vpc_id 
    prefix = var.prefix 
    retention_days = var.retention_days 
    cluster_name = var.cluster_name 
    subnet_ids = module.new-vpc.subnet_ids 
    desired_size = var.desired_size
    max_size = var.max_size
    min_size = var.min_size
}