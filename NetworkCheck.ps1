# Get network adapter configuration
$networkConfig = Get-NetIPConfiguration

# Get the user account name
$accountName = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name

# Extract relevant network details from the adapter configuration
$networkDetails = $networkConfig | Select-Object -First 1
$ipAddress = $networkDetails.IPv4Address.IPAddressToString
$subnetMask = $networkDetails.IPv4SubnetMask.IPAddressToString
$gateway = $networkDetails.DefaultGateway.IPAddressToString
$dnsServers = $networkDetails.DNSServer

# Get DHCP lease details
$dhcpServer = $networkDetails.DhcpServer

# Output lease start and end information if available

# Format output
$output = @{
    "Account Name"     = $accountName
    "IP Address"       = $ipAddress
    "Subnet Mask"      = $subnetMask
    "Gateway IP"       = $gateway
    "DNS Servers"      = $dnsServers
    "DHCP Server"      = $dhcpServer
}

# Display the output in a table
$output | Format-List
