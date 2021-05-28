# https://docs.microsoft.com/en-us/azure/active-directory/develop/howto-create-service-principal-portal

# Download Azure CLI
Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; rm .\AzureCLI.msi

# Login
# az login -u <username> -p <password>
az login

# Select and document the subscription ID
az account list --output table

# Select the subscription
az account set --subscription <Azure-SubscriptionId>

# Create Service Principal Name (SPN)
az ad sp create-for-rbac --name="spn_packer" --role="Contributor" --query="{ client_id: appId, client_secret: password, tenant_id: tenant }"

# Document the output 
# {
#   "client_id": "5b1b36d4-e361-43a8-800000000000000",
#  "client_secret": "1cfCP_sjdFYUw4bJKCmd86j1eX.000000",
#  "tenant_id": "5f89a471-531d-4e5e0000000-00000000"
# }

# Create a Resource Group for the Packer VM
az group create -l WestEurope -n PackerDemo-RG
