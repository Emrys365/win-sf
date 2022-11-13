#Requires -RunAsAdministrator

param([Parameter(Mandatory)]$path)

$file = Get-ChildItem $path

$job = Start-Job -FilePath $file.FullName `
    -InitializationScript ([scriptblock]::Create(
        @(
            "cd '$(Resolve-Path $PSScriptRoot\..\..)'"
            '. .\deploy\scripts\__base__.ps1'
            'cd deploy'
        ) -join ';'
    ))

Receive-Job $job -Wait
