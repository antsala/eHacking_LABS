$VICTIM_IP="192.168.20.13" # Es Metasploitable3-ubu1404

1.. 1024 | ForEach-Object{Write-Output((new-object Net.Sockets.TcpClient).Connect($VICTIM_IP,$_)) "Puerto $_ abierto"}