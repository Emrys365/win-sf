. .\lib\load-config.ps1

$Script:isAuditMode = (
    Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Setup\State' -ErrorAction Ignore
).ImageState -eq 'IMAGE_STATE_SPECIALIZE_RESEAL_TO_AUDIT'

& .\lib\postgen-unattend.ps1
& .\lib\postgen-taskbar.ps1

if (Test-Path 'C:\Windows\System32\WindowsPowerShell\v1.0\profile.ps1') {
    try { Set-ExecutionPolicy -Scope LocalMachine RemoteSigned -Force }
    catch [System.Security.SecurityException] {}
}

reg.exe unload HKLM\NewUser 2>&1 >$null

if ($isAuditMode) {
    Add-Type -AssemblyName PresentationFramework
    if ('OK' -eq ([System.Windows.MessageBox]::Show(@'
Author: LittleboyHarry
Status: Prepared
Blessing: Have a nice day! ^_^

Confirm: Start to sysprep now?
'@,
                'https://github.com/setupfw/win-sf',
                'OKCancel', 'Question'))
    ) {
        & C:\Windows\System32\Sysprep\Sysprep.exe /oobe /generalize /shutdown
    }
}
