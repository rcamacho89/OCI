# Oracle Cloud Infrastructure

Hi ! In this tutorial, we are going to create a Network Infrastructure with a Local Peering Gateway using Terraform, the purpose is to connect two VCN's, so this way the VCN's can interact with each other.


# Files

provider.tf --> Where we declare which provider we are using, in this case we are working with OCI.
main.tf --> Here we have the resources that we are creating such as VCN's, Route Tables, Internet Gateways, Security List and etc.
outputs.tf --> The ouputs of some resources, this is very useful when we are working with Terraform, we can manipulate and use the outputs of the resources as needed, this is a good example to keep in mind.
variables.tf --> In this file we can declare our variables.
terraform.tfvars --> This file has the inputs of the variables that we declared in the variables.tf, notice that you can use variables.tf to input the values as well, but in my case I prefer to segregate it.

Now we can jump to the Architecture.


## Architecture

This is our reference Architecture for the case : [Oracle Reference Architecture](https://docs.oracle.com/en-us/iaas/Content/Network/Tasks/localVCNpeering.htm)

![enter image description here](https://docs.oracle.com/en-us/iaas/Content/Resources/Images/network_local_peering_basic.png)
```

## HOW TO USE IT

First, you have to create an user with with enough privileges in OCI, for example of an IAM Policy: Allow Group X to manage network-family in Compartment Y.

Once you have Terraform in your local machine Windows/Linux, you have to follow the Workflow :

INIT --> PLAN --> APPLY

terraform init
terraform plan
terraform apply
