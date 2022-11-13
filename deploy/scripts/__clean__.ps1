$files = Get-ChildItem -Recurse @(
    'log\*', '*.exe', '*.msi', '*.zip'
) -Exclude '.gitkeep' -File

Write-Output $files, '', 'Confirm to clean? (Press Enter to continue)...'
Read-Host
Remove-Item $files
