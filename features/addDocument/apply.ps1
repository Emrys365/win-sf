#Requires -RunAsAdministrator

$docsFolderPath = Get-BasePath -Docs

$linksFolderPath = "$(mkdir -f "$docsFolderPath\links")"
$linksFolderName = Get-Translation 'User Guide' -cn '使用说明'

$localizedFolderPath = switch ((Get-Culture).Name) {
    zh-CN { "$docsFolderPath\zh-CN" }
    Default { "$docsFolderPath\en" }
}

Push-Location $docsFolderPath
Remove-Item -Recurse -Force *
Copy-Item -Recurse -Force "$proot\docs\*" .
Pop-Location

if (!(Test-Path ($path = "C:\users\Default\Desktop\$linksFolderName.lnk"))) {
    $it = (New-Object -ComObject WScript.Shell).CreateShortcut($path)
    $it.TargetPath = $linksFolderPath
    $it.IconLocation = 'imageres.dll,107'
    $it.save()
    Copy-Item -Force $path [Environment]::GetFolderPath('Desktop')
    Copy-Item -Force $path 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs'
}

$ws = New-Object -ComObject WScript.Shell
function New-DocShortcut([string]$id, [string]$name) {
    $it = $ws.CreateShortcut("$linksFolderPath\$name.lnk")
    $it.TargetPath = "$localizedFolderPath\$id.html"
    $it.save()
}

New-DocShortcut readme (
    Get-Translation 'README' -cn '自述文件'
)
New-DocShortcut input (
    Get-Translation 'Input & Keyboard' -cn '键盘与输入法'
)
New-DocShortcut options (
    Get-Translation 'Options' -cn '选项'
)
New-DocShortcut wsl WSL

if ($features.addNewIsolatedUserScript) {
    New-DocShortcut multiuser (
        Get-Translation 'Isolated Multi User Proctect' -cn '多用户安全隔离'
    )
}
