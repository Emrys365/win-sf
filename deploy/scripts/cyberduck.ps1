#Requires -RunAsAdministrator

$pkg = Get-ChildItem -ea 0 'Cyberduck-Installer-*.exe'
if (!$PSSenderInfo) {
    if (-not $pkg) { return }
    return @{
        name   = 'Cyberduck'
        target = 'C:\Program Files\Cyberduck\Cyberduck.exe'
    }
}

Start-Process -Wait $pkg /quiet

Set-HidpiMode 'C:\Program Files\Cyberduck\Cyberduck.exe'
