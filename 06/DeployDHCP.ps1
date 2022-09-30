# Capturamos la credencial del administrador del dominio.
$cred = Get-Credential

# Instanciamos un objeto para la sesión remota con el Controlador de Dominio.
$session = New-PSSession -ComputerName xyz-dc1 -Credential $cred

# Entramos en la sesión remota.
# Capturamos la credencial del administrador del dominio.
$cred = Get-Credential

# Instanciamos un objeto para la sesión remota con el Controlador de Dominio.
$session = New-PSSession -ComputerName xyz-dc1 -Credential $cred

# Entramos en la sesión remota.
Enter-PSSession -Session $session

#Instalamos el rol DHCP.
Install-WindowsFeature -Name DHCP

#Instalamos el rol DHCP.
Install-WindowsFeature -Name DHCP