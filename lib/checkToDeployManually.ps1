$target = 'deploy\manual'
if (Test-Path -Exclude .gitkeep "$target\*") {
    Write-Output 'Please manually deploy and confirm...'

    Start-Process $target

    Add-Type -AssemblyName PresentationFramework
    [System.Windows.MessageBox]::Show(
        'Please manually deploy yourselft at first.',
        'Continue to deploy?',
        'OK', 'Warning'
    ) >$null
}
