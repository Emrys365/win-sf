param(
    [Parameter(Mandatory)]$path,
    [Parameter(ValueFromPipeline)]$InputObject
)

. .\lib\loadAllConfig.ps1

$object = if ($null -eq $InputObject) {
    if ($flag = $features[(Get-Item $path).Name]) { $flag }
    else { 1 }
}
elseif ($InputObject.GetType() -eq [string]) {
    ConvertFrom-Json $InputObject
}
else {
    $InputObject
}

. .\features\__base__.ps1
try {
    Push-Location $path
    & .\apply.ps1 $object
}
finally {
    Pop-Location
}
