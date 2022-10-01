$pkgfile = Get-PackageFile "OpenSSH-Win64-v*.msi"
if (!$PSSenderInfo) {
    if ($pkgfile) { 'Upgraded OpenSSH' }
    return
}

Start-Process $pkgfile -PassThru '/qb /norestart',
'/l*v logs\openssh.log' | Wait-Process

Assert-Path "C:\Program Files\OpenSSH\sshd.exe"

if (0 -ne $disableSshdServer) {
    & {
        sc.exe stop sshd
        sc.exe config sshd start=disabled
    }>$null
}
