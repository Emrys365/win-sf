#Requires -RunAsAdministrator

$pkg = Get-ChildItem -ea 0 'VeraCrypt_Setup_x64_*.msi'
if (!$PSSenderInfo) {
    if (-not $pkg) { return }
    return @{
        name   = 'VeraCrypt'
        target = 'C:\Program Files\VeraCrypt\VeraCrypt.exe'
        mutex  = 1
    }
    return
}

Start-Process -Wait $pkg '/qb /norestart /l*v log\veracrypt.log ACCEPTLICENSE=YES'
