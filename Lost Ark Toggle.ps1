function game-enable { REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client" /v DisabledByDefault /t REG_DWORD /d 00000000 /f }
function game-disable { REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2" /f }
function test-registry { If (Test-Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\") {
$global:status = "Yes"
}
Else { $global:status = "No"
}}
function text-message { 
Clear-host
Write-Host "Is Lost Ark playable?: $global:$status"
Write-Host "Enter 1 to enable     " 
Write-Host "      2 to disable    " }
$continue = $true
while($continue)
{
test-registry
text-message
$selection = Read-Host
switch ($selection)
{
'1' { game-enable } 
'2' { game-disable } 
}}

