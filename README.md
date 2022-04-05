# StubS
PowerShell driven Windows Service Framework, that allows you to run any .ps1 as a Windows Service

## Details:
StubS or (Stub Service) comes from the Active Setup idea of "Just in time" setup.

The StubS executable can be changed to any name.  The Service binary becomes that entity, and looks for a JSON config file with the same name in the root / execution directory.  

``` yaml
{
  "Invoke": {
    "ScriptPath": "<FullPath_ScriptName>.ps1",
    "ScriptArguments": "",
    "LoopInterval": 30
  },
  "Stop": {
    "ScriptPath": "<FullPath_ScriptName>.ps1",
    "ScriptArguments": "",
    "LoopInterval": 15
  }
}
```

There are 2 Sub section
* Invoke = Is executed when the service is started
* Stop = Is exectued when the service is stopped

Note:  There are 2 other sources coming in the next release
* Continue
* Pause




### Add/Remove Service
Install Service w/ PowerShell: 
``` yaml
New-Service -Name StubS -BinaryPathName "C:\Source\dev\Posh\StubS\bin\x64\StubS.exe" -DisplayName StubS -StartupType  AutomaticDelayedStart
```
Note:  You can rename the Stubs.exe to anything you like and also set the Service details in the New-Service cmdlet

Stop Service w/ PowerShell:
``` yaml
Stop-Service -Name Stubs
```

Remove Service w/ PowerShell:
``` yaml
Remove-Service -Name Stubs
```

Kill Service w/ PowerShell if Stop-Service fails:
``` yaml
Stop-Process -Name Stubs
```
