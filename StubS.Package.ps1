#------------------------------------------------------------------------
# Source File Information (DO NOT MODIFY)
# Source ID: 621e2282-13a1-45c0-ac4d-e4189147d1e9
# Source File: C:\Source\Dev\Posh\StubS\StubS.psproj
#------------------------------------------------------------------------
#region Project Recovery Data (DO NOT MODIFY)
<#RecoveryData:
mgEAAB+LCAAAAAAABABlkcFOwzAMhu+T9g5VjkhtmlBg07Ie0DSJCyA6cQ+Nx4LSJkpTtPL0pE0K
Q1zs/LZ/f7LCXqDWn2CHHXe8XC6ShD1b/QG1S6qhrU9Wt/ILxBbtueoATcW9VA7sFl1lpiObMTYh
iZDIuVHT4zjFzsdQOYEymTs7NIE86hVsJ3Vb0owwPIvY8xR42JW3lAClK5qSa07S4qbOU14XIoWC
rNakuBME1gzH4WiNFxwGA2XO8KWcl2slPC7Bl7QuiiiT+14qf3mOyspx63ozHhNYsw3/+n44QT1Z
+S5brsaBR96A39G/VX6D8VMM/2svFwz/+YtvaWL+VZoBAAA=#>
#endregion
<#
    .NOTES
    --------------------------------------------------------------------------------
     Code generated by:  SAPIEN Technologies, Inc., PowerShell Studio 2020 v5.7.182
     Generated on:       3/20/2022 3:37 PM
     Generated by:       Admin
    --------------------------------------------------------------------------------
    .DESCRIPTION
        Script generated by PowerShell Studio 2020
#>



#region Source: Startup.pss
#region File Recovery Data (DO NOT MODIFY)
<#RecoveryData:
YQAAAB+LCAAAAAAABACzCUpNzi9LLap0SSxJVAAyijPz82yVjPWMlOx4uRQUbPyLMtMz8xJz3DJz
Uv0Sc1PtgksSi0pKC/QKiott9DFkebls9JGNtAMAXtMIOWEAAAA=#>
#endregion
#----------------------------------------------
#region Import Assemblies
#----------------------------------------------
#endregion Import Assemblies

# Warning: Do not rename Start-MyService, Invoke-MyService and Stop-MyService functions


function Start-MyService
{
	#region Initialize global variables
    	$global:bRunService = $true
    	$global:bServiceRunning = $false
    	$global:bServicePaused = $false
    #endregion Initialize global variables
    
    #region Grab File Information
        $global:CurFileInfo = Get-Process -Id $pid | Select-Object -ExpandProperty Path
        $global:ServiceHash = @{}
        $global:ServiceHash.ServicePath = $global:CurFileInfo | Split-Path -Parent
        $global:ServiceHash.ServiceConfigFile = $($global:CurFileInfo | Split-Path -Leaf) -replace '\.exe$','.json'
        $global:ServiceHash.ServiceDebug = $false
        
        If (Test-Path -Path $('{0}\{1}' -f $global:ServiceHash.ServicePath, $($global:CurFileInfo | Split-Path -Leaf) -replace '\.exe$','.debug')) {
            $global:ServiceHash.ServiceDebug = $true
            $($global:ServiceHash).ToString() | Out-File -FilePath $('{0}\Debugger.log' -f $global:ServiceHash.ServicePath) -Force
            Write-Host 'Running Start-MyService'
            'Running Start-MyService' | Out-File -FilePath $('{0}\Debugger.log' -f $global:ServiceHash.ServicePath) -Append
            Write-Host "ServicePath $($global:ServiceHash.ServicePath)"
            "ServicePath $($global:ServiceHash.ServicePath)" | Out-File -FilePath $('{0}\Debugger.log' -f $global:ServiceHash.ServicePath) -Append
            Write-Host "ServiceConfigFile $($global:ServiceHash.ServiceConfigFile)"
            "ServiceConfigFile $($global:ServiceHash.ServiceConfigFile)" | Out-File -FilePath $('{0}\Debugger.log' -f $global:ServiceHash.ServicePath) -Append
            Write-Host "ServiceDebug $($global:ServiceHash.ServiceDebug)"
            "ServiceDebug $($global:ServiceHash.ServiceDebug)" | Out-File -FilePath $('{0}\Debugger.log' -f $global:ServiceHash.ServicePath) -Append
        }
    #endregion Grab File Information
    
    #region Query Json Config
        Try {
            $global:ServiceHash.Config = Get-Content -Path $('{0}\{1}' -f $global:ServiceHash.ServicePath, $global:ServiceHash.ServiceConfigFile) -ErrorAction Stop
        } Catch {
            Write-Host $_.Exception.Message
            If ($global:ServiceHash.ServiceDebug) {
                $_.Exception.Message | Out-File -FilePath $('{0}\Debugger.log' -f $global:ServiceHash.ServicePath) -Append
            }
        }
        
        If ($global:ServiceHash.ServiceDebug) {
            Write-Host "Config $($global:ServiceHash.Config | ConvertTo-Json -Depth 5)"
            "Config $($global:ServiceHash.Config | ConvertTo-Json -Depth 5)" | Out-File -FilePath $('{0}\Debugger.log' -f $global:ServiceHash.ServicePath) -Append
        }
    #endregion Query Json Config
        
    #region Update Execution Policy
        $global:CurPolicy = $(Get-ExecutionPolicy | Out-String).Trim()
        Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser
    #endregion Update Execution Policy
}

function Invoke-MyService
{
    If ($global:ServiceHash.ServiceDebug) {
        Write-Host "Running Invoke-MyService"
        "Running Invoke-MyService" | Out-File -FilePath $('{0}\Debugger.log' -f $global:ServiceHash.ServicePath) -Append
    }
    
	$global:bServiceRunning = $true
	While ($global:bRunService) {
		Try {
                If ($global:ServiceHash.ServiceDebug) {
                    Write-Host "Running Invoke-MyService - bRunService True"
                    "Running Invoke-MyService - bRunService True" | Out-File -FilePath $('{0}\Debugger.log' -f $global:ServiceHash.ServicePath) -Append
                }
        
                If ($global:bServicePaused -eq $false)  {
                    If ($global:ServiceHash.ServiceDebug) {
                        Write-Host "Running Invoke-MyService - bServicePaused False"
                        "Running Invoke-MyService - bServicePaused False" | Out-File -FilePath $('{0}\Debugger.log' -f $global:ServiceHash.ServicePath) -Append
                    }
                    
    				#Place code for your service here
    				#e.g. $ProcessList = Get-Process solitaire -ErrorAction SilentlyContinue
    				
    				# Use Write-Host or any other PowerShell output function to write to the System's application log
                    If (Test-Path -Path "$($global:ServiceHash.Config.Invoke.ScriptPath)") {
                        If ( $global:ServiceHash.Config.Invoke.ScriptArguments ) {
                            Invoke-Expression -Command "$($global:ServiceHash.Config.Invoke.ScriptPath) $($global:ServiceHash.Config.Invoke.ScriptArguments)" -ErrorAction Stop
                        } Else {
                            Invoke-Expression -Command "$($global:ServiceHash.Config.Invoke.ScriptPath)" -ErrorAction Stop
                        }
                    } Else {
                        Write-Host "Failed to Find Invoke.ScriptPath File: $($global:ServiceHash.Config.Invoke.ScriptPath)"
                        "Failed to Find Invoke.ScriptPath File: $($global:ServiceHash.Config.Invoke.ScriptPath)" | Out-File -FilePath $('{0}\Debugger.log' -f $global:ServiceHash.ServicePath) -Append
                    }
    			} Else {
                    Write-Host "Running Invoke-MyService - bServicePaused True"
                    "Running Invoke-MyService - bServicePaused True" | Out-File -FilePath $('{0}\Debugger.log' -f $global:ServiceHash.ServicePath) -Append
                }
		} Catch {
			# Log exception in application log
			Write-Host $_.Exception.Message
            If ($global:ServiceHash.ServiceDebug) {
                $_.Exception.Message | Out-File -FilePath $('{0}\Debugger.log' -f $global:ServiceHash.ServicePath) -Append
            }
		}
		
        #region Adjust sleep timing to determine how often your service becomes active.
    		If ($global:bServicePaused -eq $true) {
    			Start-Sleep -Seconds $global:ServiceHash.Config.Pause.LoopInterval # if the service is paused we sleep longer between checks.
    		} Else {
    			Start-Sleep –Seconds $global:ServiceHash.Config.Invoke.LoopInterval # a lower number will make your service active more often and use more CPU cycles
    		}
        #endregion Adjust sleep timing to determine how often your service becomes active.
	}
	$global:bServiceRunning	= $false
}

function Stop-MyService
{
	$global:bRunService = $false # Signal main loop to exit
	$CountDown = $global:StopLoopInterval # Maximum wait for loop to exit
	while($global:bServiceRunning -and $Countdown -gt 0)
	{
		Start-Sleep -Seconds 1 # wait for your main loop to exit
		$Countdown = $Countdown - 1
	}
	# Place code to be executed on service stop here
	# Close files and connections, terminate jobs and
	# use remove-module to unload blocking modules
    
    If ($global:ServiceHash.ServiceDebug) {
        Write-Host "Running Stop-MyService"
        "Running Stop-MyService" | Out-File -FilePath $('{0}\Debugger.log' -f $global:ServiceHash.ServicePath) -Append
    }
    
    If (Test-Path -Path "$($global:ServiceHash.Config.Stop.ScriptPath)") {
        If ( $global:ServiceHash.Config.Stop.ScriptArguments ) {
            Invoke-Expression -Command "$($global:ServiceHash.Config.Stop.ScriptPath) $($global:ServiceHash.Config.Stop.ScriptArguments)" -ErrorAction Stop
        } Else {
            Invoke-Expression -Command "$($global:ServiceHash.Config.Stop.ScriptPath)" -ErrorAction Stop
        }
    } Else {
        Write-Host "Failed to Find Stop.ScriptPath File: $($global:ServiceHash.Config.Stop.ScriptPath)"
        "Failed to Find Stop.ScriptPath File: $($global:ServiceHash.Config.Stop.ScriptPath)" | Out-File -FilePath $('{0}\Debugger.log' -f $global:ServiceHash.ServicePath) -Append
    }
}
#endregion Source: Startup.pss

