# Load ADAL Assemblies
$adal = "${env:ProgramFiles(x86)}\Microsoft SDKs\Azure\PowerShell\ServiceManagement\Azure\Services\Microsoft.IdentityModel.Clients.ActiveDirectory.dll"
$adalforms = "${env:ProgramFiles(x86)}\Microsoft SDKs\Azure\PowerShell\ServiceManagement\Azure\Services\Microsoft.IdentityModel.Clients.ActiveDirectory.WindowsForms.dll"
[System.Reflection.Assembly]::LoadFrom($adal)
[System.Reflection.Assembly]::LoadFrom($adalforms)

# Set Azure AD Tenant name
$adTenant = "microsoft.onmicrosoft.com" 
# Set well-known client ID for AzurePowerShell

$clientId = "1950a258-227b-4e31-a9cf-717495945fc2"

# Set redirect URI for Azure PowerShell
$redirectUri = "urn:ietf:wg:oauth:2.0:oob"

# Set Resource URI to Azure Service Management API
$resourceAppIdURI = "https://management.core.windows.net/"

# Set Authority to Azure AD Tenant
$authority = "https://login.windows.net/$adTenant"

# Create Authentication Context tied to Azure AD Tenant
$authContext = New-Object "Microsoft.IdentityModel.Clients.ActiveDirectory.AuthenticationContext" -ArgumentList $authority

# Acquire token
$authResult = $authContext.AcquireToken($resourceAppIdURI, $clientId, $redirectUri, "Auto")
$authHeader = $authResult.CreateAuthorizationHeader()
$authHeader | Out-File C:\Users\makolo\git\powershell\azureauth\jwt.txt