# terraform apply -var-file staging.tfvars -auto-approve
resource_group_name = "rg_week5"
location            = "eastus"

num_of_instances                = 2
admin_username                  = "adminuser"
admin_password                  = "Tamir@123"
postgres_administrator_login    = "postgres"
postgres_administrator_password = "p@ssw0rd42"
myIP_Address                    = "109.186.1.181"

okta_org_url   = "dev-14480648.okta.com"
okta_secret    = "SpLrCPEcnXt68xMLS7V8t7C_XASwKYGw6itGKlc_"
okta_client_id = "0oa42lil8krSmSfF25d7"
okta_key       = "00L_Ypmrm4bWaGRrK1D6h0Uq6Q-BuUmUp9kjbLfMtr"