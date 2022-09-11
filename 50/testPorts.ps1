$VICTIM_IP="192.168.20.13" # Es Metasploitable3-ubu1404


# Abre una conexión TCP contra la IP:Puerto.
# Permite establecer el Timeout, de forma que si el puerto está cerrado no hay que esperar 30 segundos.
function Test-Port {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline = $true, HelpMessage = 'Se le puede poner :Port')]
        [String[]]$ComputerName,

        [Parameter(HelpMessage = 'Será ignorado si el puerto ya se proporciona en el parámetro ComputerName')]
        [Int]$Port = 5985,

        [Parameter(HelpMessage = 'Timeout en milisegundos.')]
        [Int]$Timeout = 1000
    )

    begin {
        $result = [System.Collections.ArrayList]::new()
    }

    process {
        foreach ($originalComputerName in $ComputerName) {
            $remoteInfo = $originalComputerName.Split(":")
            if ($remoteInfo.count -eq 1) {
                # Si $ComputerName está en la forma de 'host'
                $remoteHostname = $originalComputerName
                $remotePort = $Port
            } elseif ($remoteInfo.count -eq 2) {
                # Si $ComputerName está en la  forma de 'host:port',
                $remoteHostname = $remoteInfo[0]
                $remotePort = $remoteInfo[1]
            } else {
                $msg = "Formato incorrecto para el parámetro ComputerName: " `
                    + "[$originalComputerName]. " `
                    + "Los formatos permitidos son [hostname] o [hostname:port]."
                Write-Error $msg
                return
            }

            $tcpClient = New-Object System.Net.Sockets.TcpClient
            $portOpened = $tcpClient.ConnectAsync($remoteHostname, $remotePort).Wait($Timeout)

            $null = $result.Add([PSCustomObject]@{
                RemoteHostname       = $remoteHostname
                RemotePort           = $remotePort
                PortOpened           = $portOpened
                TimeoutInMillisecond = $Timeout
                SourceHostname       = $env:COMPUTERNAME
                OriginalComputerName = $originalComputerName
                })
        }
    }

    end {
        return $result
    }
}

$VICTIM_IP="192.168.20.13" # Es Metasploitable3-ubu1404

1..1024 | ForEach-Object{
    # Cunsultamos valor del puerto. 500 ms timeout.
    $result = Test-Port $VICTIM_IP $_ 500
   
    if ($result.PortOpened -eq $true) {
        Write-Output("Puerto $_ abierto")
    }
}

