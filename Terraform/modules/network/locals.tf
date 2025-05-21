locals {
  public_subnet_cidrs  = [for i in range(2) : cidrsubnet(var.vpc_cidr, 8, i)]

  subnets =[
    {
        name        = "public-subnet-1"
        cidr_block  =  element(local.public_subnet_cidrs,0)
        az          = "us-east-1a"
        public      =  true
    },
    {
        name        = "public-subnet-2"
        cidr_block  =  element(local.public_subnet_cidrs,1)
        az          = "us-east-1b"
        public      =  true
    },
    {
        name        = "private-subnet"
        cidr_block  = cidrsubnet(var.vpc_cidr, 8, 2)
        az          = "us-east-1a"
        public      =  false
    }
  ]
}