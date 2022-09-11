$VICTIM_IP="192.168.20.13" # Es Metasploitable3-ubu1404

1.. 1024 | %{Write-Output((new-object Net.Sockets.TcpClient).Connect($VICTIM_IP,$_)) “Port $_ is open!”} 2>$null