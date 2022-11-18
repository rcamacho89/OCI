# Oracle Cloud Infrastructure

Hi ! We are going to create a Network Infrastructure with a Local Peering Gateway using Terraform, the purpose is to connect two VCN's, so this way the VCN's can interact with each other.

Notice that we will cover just ''**Always free resources**" in OCI.


# Files

provider.tf --> Where we declare which provider we are using in Terraform, in this case we are working with OCI.

main.tf --> Here we have the resources that we are creating such as VCN's, Route Tables, Internet Gateways, Security List and etc.

outputs.tf --> The ouputs of some resources, this is very useful when we are working with Terraform, we can manipulate and use the outputs of the resources as needed, this is a good example to keep in mind.

variables.tf --> In this file we can declare our variables.

terraform.tfvars --> This file has the inputs of the variables that we declared in the variables.tf, notice that you can use variables.tf to input the values as well, but in my case I prefer to segregate it.

Now we can jump to the Architecture.


## Architecture

This is our reference Architecture for the case : [Oracle Reference Architecture](https://docs.oracle.com/en-us/iaas/Content/Network/Tasks/localVCNpeering.htm)

![enter image description here](https://docs.oracle.com/en-us/iaas/Content/Resources/Images/network_local_peering_basic.png)


## HOW TO USE IT

First, you have to create an user with with enough privileges in OCI, for example of an IAM Policy: Allow Group X to manage virtual-network-family in Compartment Y. After that you can generate the API Key for the user !

If you are not aware of how Terraform works with the basics, consider to go to the Webpage [Terraform OCI provider](https://registry.terraform.io/providers/oracle/oci/latest/docs) and read the documentation !

### TERRAFORM WORKFLOW

INIT --> PLAN --> APPLY

terraform init

terraform plan

terraform apply

##### Once you have your network infrastructure deployed, you can go ahead and create two instances, one using the VCN 1 and other in the VCN 2, test the connection on port 22 from the VM in the VCN 1 to the VM in the VCN 2. Now that you got the idea, you can customize it for your case !
