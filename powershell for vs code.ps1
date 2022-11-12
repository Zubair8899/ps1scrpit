﻿function Log-Message {
    Param(
        [parameter(Mandatory = $true, position = 0)]
        [String]
        $LogMessage,
        [parameter(Mandatory = $false, position = 1)]
        [bool]
        $LogDateTime = $true,
        [parameter(Mandatory = $false, position = 2)]
        [bool]
        $BlankLine = $false
    )
if ($LogDateTime) {
        Write-Output ("{0} - {1}" -f (Get-Date), $LogMessage)
    }
    else {
        Write-Output $LogMessage
    }
if ($BlankLine) { Write-Output "" }
}
$installVSCode = $true
$vscodeExe = "$scriptPath\Misc_Installers\VSCodeUserSetup-x64-1.45.1.exe"
# --------------------------------
# STEP - Visual Studio Code
# --------------------------------
if ($installVSCode) {
    Log-Message "Installing Visual Studio Code"
    $vscodeArgs = "/VERYSILENT /MERGETASKS=!runcode"
    $vscodeInstall = Start-Process -FilePath $vscodeExe -passthru -wait -ArgumentList $vscodeArgs
    $exitCode = $vscodeInstall.ExitCode
if ($exitCode -ne 0) {
        Log-Message "    ERROR ($exitCode) - Visual Studio Code install FAILED!!" $true $true
        return
    }
    else {
        Log-Message "    Visual Studio Code installed Successfully!"
    }
}