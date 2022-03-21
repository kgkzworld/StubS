$Outpath = $('{0}\Log' -f $global:ServiceHash.ServicePath)
$global:InvokeOutType = 'Invoke'
$global:InvokeDate = $(Get-Date).ToString() -replace '/|/s+|:','_' -replace ' ','_'
'' | Out-File -FilePath $('{0}\{1}_{2}.log' -f $Outpath, $global:InvokeOutType, $global:InvokeDate)