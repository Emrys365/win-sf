#Requires -RunAsAdministrator

$pkg = Get-ChildItem -ea 0 'AltSnap*-x64-inst.exe'
if (!$PSSenderInfo) {
    if (-not $pkg) { return }
    return @{
        name   = 'AltSnap'
        target = "$env:APPDATA\AltSnap\AltSnap.exe"
    }
}

mkdir -f C:\SetupFw | Out-Null

Copy-Item $pkg "C:\SetupFw\install-altsnap.exe"

$scriptPath = "C:\SetupFw\install-altsnap.ps1"
$lnkname = "$(Get-Translation 'Install' -cn '安装') AltSnap"
New-SetupScriptShortcut -psspath $scriptPath -lnkname $lnkname

$parts = ((Get-Content 'config\install-altsnap.ps1') -join "`n") -split '; config here'
$content = @(
    $parts[0],
    ((Get-Content 'config\altsnap.ini') -join "`n"),
    $parts[1]
) -join '' -replace '# Remove desktop shortcut', "rm -fo `"`$([Environment]::GetFolderPath('Desktop'))\$lnkname.lnk`""
if ((Get-Culture).Name -eq 'zh-CN') {
    $content = $content -replace '(?<=Language=)en-US', 'zh-CN'
}
$content > $scriptPath
