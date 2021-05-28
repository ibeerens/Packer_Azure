# Download Azure CLI
Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; rm .\AzureCLI.msi

# Login
# az login -u <username> -p <password>
az login

# Create Service Principal Name
az ad sp create-for-rbac --name="spn_packer" --role="Contributor" --query="{ client_id: appId, client_secret: password, tenant_id: tenant }"

# Document the output 
# {
#   "client_id": "5b1b36d4-e361-43a8-800000000000000",
#  "client_secret": "1cfCP_sjdFYUw4bJKCmd86j1eX.000000",
#  "tenant_id": "5f89a471-531d-4e5e0000000-00000000"
# }
