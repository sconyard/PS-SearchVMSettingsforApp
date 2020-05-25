 <#
    .DESCRIPTION: Seraches the contents of the Advanced Setting guestinfo.appinfo for an application string 
    .REQUIREMENTS: VMware PowerCLI
    .NOTES  Author:  Simon Conyard
    .NOTES  Site:    www.virtual-simon.co.uk
    .NOTES  Reference:  https://virtual-simon.co.uk/powershell-searching-guestinfo-appinfo-for-an-application-or-service/
#>

#Setting the VM advanced setting field and what application/service to search for
$Advsetting = 'guestinfo.appinfo'
$App = Read-Host -Prompt "Enter the case sensitive executable name to search for; e.g svchost, winlogon, dns, DFSRs"

#Ask for a VMware Cluster to target 
$allclusters = Get-Cluster
    Write-Host ("$allclusters") -ForegroundColor DarkGreen -BackgroundColor White
$cluster = Read-Host -Prompt "Enter the connected Cluster Name from the list above"
$GuestType = Read-Host -Prompt "e.g. windowsGuest or linuxGuest"
 
#Take the set variables to define virtual machines to target for search
$VMS = Get-VM -Location $cluster | Where-Object{($_.Guest.GuestFamily -eq ("$($GuestType)") -and $_.PowerState -eq 'PoweredOn')}

#Test to see if Application/service exists
foreach($VM in $VMS){
$Adv = Get-AdvancedSetting -Entity $VM -Name $Advsetting
$Value = $Adv.value
if ($null -eq $Value) {
    write-host ("$App is not found on $VM!") -ForegroundColor DarkGreen -BackgroundColor White
    }
else {
    write-host ("$App found on $VM! outputting version information --- ") -ForegroundColor White -BackgroundColor DarkGreen

    $Adv.Value | Select-String -Pattern ("$($App)") -SimpleMatch -CaseSensitive | Out-String -Stream | Select-String -Pattern ("$($App)")
    } 
} 