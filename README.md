# Starting a new project

## Requirements

- An Azure Subscription
- An Azure DevOps Organization
- Azure CLI

## Creating the Storage Account for the Terraform state

Fill the variables below and run the commands to create the Storage Account and the Blob Container.

```bash
# Variables
SUBSCRIPTION_ID=YOUR_SUBSCRIPTION_ID # You can get it with az account list
LOCATION=LOCATION # e.g. eastus
RESOURCE_GROUP_NAME=RESOURCE_GROUP_NAME # e.g. myprojecttfstate
STORAGE_ACCOUNT_NAME=STORAGE_ACCOUNT_NAME # e.g. myprojecttfstate
CONTAINER_NAME=tfstate

# Set subscription
az account set \
	--subscription=$SUBSCRIPTION_ID

# Create resource group
az group create \
	--name $RESOURCE_GROUP_NAME \
	--location $LOCATION \
	--subscription $SUBSCRIPTION_ID

# Create storage account
az storage account create \
	--name $STORAGE_ACCOUNT_NAME \
	--location $LOCATION \
	--sku Standard_LRS \
	--encryption-services blob \
	--resource-group $RESOURCE_GROUP_NAME

# Create blob container
az storage container create \
	--name $CONTAINER_NAME \
	--account-name $STORAGE_ACCOUNT_NAME \
	--fail-on-exist
```

## Getting the Personal Access Token (PAT) with access to the Azure DevOps Organization

- Go to your Azure DevOps. Select an organization.
- Click the icon next to your icon at the right top corner.
- Select "Personal access tokens".
- Click "New Token" then create a new personal access token with the access required by your template. This will be driven primarily based on which resources you need to provision in Azure DevOps. A token with Full access scope will work but may provide more access than you need.
- Copy the personal access token.

Reference: [Authenticating using PAT](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/guides/authenticating_using_the_personal_access_token)

## Setup provider

Fill the information on the [provider.tf](./provider.tf) file, according to the comments.

## Set environment variables

```bash
export AZDO_PERSONAL_ACCESS_TOKEN=<Personal Access Token>
export AZDO_ORG_SERVICE_URL=https://dev.azure.com/<Your Org Name>
```

## Starts the Terraform state

```bash
terraform init
```

# Working on an existing project

## Requirements

- Access to the Azure Subscription of the project
- Contributor access to the Storage Account where the Terraform state is stored
- A PAT with access to the Azure DevOps Organization
- Azure CLI

## Step-by-step

- Set the correct subscription:

```bash
az account set --subscription=$SUBSCRIPTION_ID
```

- Get the state:

```bash
terraform init
```

- (optional) Validate the changes:

```bash
terraform validate
```

- (optional) Plan the changes:

```bash
terraform plan
```

- Apply the changes:

```bash
terraform apply
```
