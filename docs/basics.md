# Terraform

- Declarative technology 
- Build, change and provisioning of an infrastructure
- Multi-cloud development
- Uses HashiCorps Configuration language (HCL)
- Uses the same format for all providers (Azure, AWS, ...)

## Workflow
- Create terraform configuration file
- Initialize Terraform
  - Is done by running the command ```terraform init```
  - Looks to work-base, go through the files and create the initial state. It will then look for 
  the plugins we are using and downland them. The .terraform folder will be generated containing those 
  download plugins.
- Plan
  - Display or view what we are wailing (planning) to do. What are the actions that will be executed
  - Run the command ``terraform plan``    
- Apply changes
  - Run the command ``terraform apply --auto-approve`` (-auto-approve: to avoid yes/no validation)
  - ***terraform.tfstate*** and ***terraform.tfstate.backup*** (the second time)  will be generated, and they should never be manually modified
  - Run ```terrafrom show``` to show the content of state file

- Destroy
  - Once we are done with the infra we can destroy it ```terrafrom destroy```
    

## Data types

- Primitive: string, number and bool
- Collection: list, set and map 
- Structural: tuple and object
- Any
- Null 

## Validate config files 
 
- ```terraform fmt``` can be used, to will format Terraform files. It uses two flags 
  -  ```check``` it doesn't alter the files
  -  ```recursice``` it checks anf reformat files
 
## Supply variables

- Default value
- ```-var flag```
- ```-var-file flag```
- From the files terraform.tfvars or terraform.tfvars.json
- From the files .auto.tfvars or .auto.tfvars.json
- From environments variables that start with **TF_VAR_**


## Looping 
 
- **Count:** how many resources should be created
- **For_each:**
- **Dynamic blocks (advanced topic):**

## Functions and expression

- built-in functions
- Custom functions ? 

## Modules 

- Collection of terraform files in directory 
- It allows code reuse

## How it works
- Manage states by creating backup file
- Creating state file
- When we are starting to use Terraform, it's recommended to not use other way to provision
- Inside a team:
    - We should be sure that the state file is not modified at the same time
    - We should ensure to use the latest version of the file
    - Use the remote bucket
- If the infrastructure was updated outside the Terraform we need to run ``terraform refresh``
  to update file state
- For Quickstart with Azure visit [this link](https://github.com/Azure/terraform/tree/master/quickstart)
- For this Azure provider visit [this link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs) 

## Azure Key vault
- Azure Key vault can be used to store sensitive data we don't need in variables or state files
- The account running Terraform should have the rights to access the secrets in the vault
- The secrets referenced just like any other data source

## Pipeline (Azure Devops and Github integration)
- Ideally the code should be checked and deployed via automated pipelines
- HashiCorps has a setup-terraform Github action which adds terraform to the path making its
  capabilities available

## Installation

- ```wget https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip```