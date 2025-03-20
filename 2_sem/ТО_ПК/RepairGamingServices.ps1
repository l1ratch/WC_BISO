Get-AppxPackage *gamingservices* -allusers | remove-appxpackage -allusers

Remove-Item -Path "HKLM:\System\CurrentControlSet\Services\GamingServices" -recurse

Remove-Item -Path "HKLM:\System\CurrentControlSet\Services\GamingServicesNet" -recurse