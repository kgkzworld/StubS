$Outpath = $('{0}\Log' -f $global:ServiceHash.ServicePath)
$global:StopOutType = 'Stop'
$global:StopDate = $(Get-Date).ToString() -replace '/|/s+|:','_' -replace ' ','_'
'' | Out-File -FilePath $('{0}\{1}_{2}.log' -f $Outpath, $global:StopOutType, $global:StopDate)