# week6-terraform-ansible

![image](https://bootcamp.rhinops.io/images/week-6-envs.png)

## Configuration:
* Clone this reposetory
* Install Terraform
* Use `azurerm` as a [provider](https://www.terraform.io/docs/language/providers/configuration.html).
* Run in the cli "terraform init"
* Create 2 workspaces Production and Staging and select one
* For Production workspace run in the cli `terraform apply -var-file production.tfvars -auto-approve` 
* For Staging workspace run in the cli `terraform apply -var-file staging.tfvars -auto-approve`

in `production.tfvars` and `staging.tfvars` you have those variables and you will need to fill the blanks one

```
resource_group_name = "rg_week5"
location            = "eastus"

num_of_instances                = 2
admin_username                  = ""
admin_password                  = ""
postgres_administrator_login    = "postgres"
postgres_administrator_password = ""
myIP_Address                    = "" / your IP address

okta_org_url   = ""
okta_secret    = ""
okta_client_id = ""
okta_key       = ""
```
the only thing thats diffrent are `num_of_instances`, in production we have 3 instances and in staging 2 instances (Goal 4)

`okta_key` is used to fill automatic your okta app sign-in redirect URIs.
the get key go to your okta portal.
`on the left menu choose Security -> API`
click on the `Tokens tab` and click `Create Token`


## Goals:

 1. Use Terraform to provision the infrastructure.
 2. Use Ansible to deploy the NodeWeightTracker application. - https://github.com/TamirAtia/ansible-bootcamp
 3. Create two environments: Staging and Production
 4. Both environments must be identical except for the size of the vms (production ones must be larger).
 5. Using a Managed Postgresql




## Terraform Installing

We have to use a terraform platform and let's get practice first with a simple hands on manual

https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/azure-get-started

https://docs.microsoft.com/en-us/azure/developer/terraform/create-linux-virtual-machine-with-infrastructure

then we will build our app environment using infrastructure as a code (IaaC) in Azure cloud

https://azure.microsoft.com/en-us/account/
