# Capturamos la credencial del administrador del dominio.
$cred = Get-Credential

# Instanciamos un objeto para la sesión remota con el Controlador de Dominio.
$session = New-PSSession -ComputerName xyz-dc1 -Credential $cred

# Entramos en la sesión remota.
Enter-PSSession -Session $session

# Instalamos el rol DHCP.
Install-WindowsFeature -Name DHCP -ComputerName xyz-dc1

# Autorizamos el servidor DHCP en Active Directory.
Add-DhcpServerInDC -DnsName xyz-dc1.xyz.com -IPAddress 192.168.20.10

# Verificamos que ha sido autorizado.
Get-DhcpServerInDC

# Configuramos el servidor para que realice actualizaciones dinámicas en DNS.
Set-DhcpServerv4DnsSetting -ComputerName xyz-dc1 -DynamicUpdates "Always" -DeleteDnsRRonLeaseExpiry $True

# Proporcionamos credenciales para que el servidor DHCP pueda actualizar DNS.
Set-DhcpServerDnsCredential -Credential $cred

# Creamos el ámbito 192.168.20.100-200
Add-DhcpServerv4Scope -Name RedLocal -StartRange 192.168.20.100 -EndRange 192.168.20.200 -SubnetMask 255.255.255.0

# Ponemos la opción de Gateway. 
Set-DhcpServerv4OptionValue -OptionId 3 -Value 192.168.20.1 -ScopeId 192.168.20.100 -ComputerName xyz-dc1.xyz.com

# Ponemos la opción de servidor DNS.
Set-DhcpServerv4OptionValue -DnsDomain xyz.com -DnsServer 192.168.20.10
