# Oracle Cloud Infrastructure

Hi ! We are going to create a basic OCI infrastructure using Terraform, the purpose is to create the basic foundations and expose two instances using a Load Balancer.

Notice that we will cover just ''**Always free resources**" in OCI.


# Files

provider.tf --> Where we declare which provider we are using in Terraform, in this case we are working with OCI.

network.tf --> Here we have the resources that we are creating such as VCN's, Route Tables, Internet Gateways, Security List and etc.

compute.tf --> Here we have the compute resources, instance-a and instance-b.

lb.tf --> Here we have the load balancer structure.

outputs.tf --> The ouputs of some resources, this is very useful when we are working with Terraform, we can manipulate and use the outputs of the resources as needed, this is a good example to keep in mind.

variables.tf --> In this file we can declare our variables.

terraform.tfvars --> This file has the inputs of the variables that we declared in the variables.tf, notice that you can use variables.tf to input the values as well, but in my case I prefer to segregate it.

Now we can jump to the Architecture.


## Architecture

![Hashicorp_Terraform_Associate_v1](https://user-images.githubusercontent.com/86194197/216858392-d461a9bd-de44-45d4-b02b-e13d43389306.jpg)

## Resources

We are creating the following resources:

- 1 Compartment.
- 1 VCN.
- 1 Internet Gateway.
- 2 Subnets.
- 2 Route tables, each one with 2 rules.
- 2 Security List, each one with one Egress and Ingress rule.
- 2 Instances.
- 1 Load Balancer.

You can see the details in the Terraform files.

## HOW TO USE IT

First, you have to create an user with sufficient privileges in OCI, for example of an IAM Policy: 

- Allow Group X to manage virtual-network-family in compartment Y
- Allow Group X to manage compartments in compartment Y

After that you can generate the API Key for the user ! Remember that you need to adjust the Policy based on the resources that you will work with.

Notice that you have to configure some environment variables in your operating system in order to reach out your Cloud Provider.

If you are not aware of how Terraform works with the basics, consider to go to the Webpage [Terraform OCI provider](https://registry.terraform.io/providers/oracle/oci/latest/docs) and read the documentation !

### TERRAFORM WORKFLOW

INIT --> PLAN --> APPLY

terraform init

terraform plan

terraform apply

##### Access the URL through the Load Balancer IP to see the content ! #####
