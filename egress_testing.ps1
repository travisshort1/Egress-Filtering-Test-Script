# Define the target host and ports to test
$targetHost = (resolve-dnsname -Type A open.zorinaq.com ).IPAddress
$ports = @(2..19)  # Add your list of ports here

# Loop through each port and test the connection
foreach ($port in $ports) {
    $result = Test-NetConnection -ComputerName $targetHost -Port $port
    if ($result.TcpTestSucceeded) {
        Write-Host "Port ${port}: Connection to $targetHost succeeded." -ForegroundColor Green
    } else {
        Write-Host "Port ${port}: Connection to $targetHost failed." -ForegroundColor Red
    }
}