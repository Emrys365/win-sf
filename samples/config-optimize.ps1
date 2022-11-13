$features.applyOptimization = 1
$features.applyRemapIcon = 1
$features.enableClipboardHistory = 1
$features.fixHidpiBlur = 1

$features.addUserFirstRun = [ordered]@{
    addDesktopIconConfigMenuItem       = 1
    showUserFolderAtDesktop            = 1
    showLibrariesAtDesktop             = 1
    showThisPcAtDesktop                = 1
    showNetworkInterfacesAtDesktop     = 1
    showRecentFoldersInExplorerSidebar = 1
    showRecyleBinInExplorerSidebar     = 1
}

if ($features.tweakContextmenu -eq 0) { $features.tweakContextmenu = [ordered]@{} }
$it = $features.tweakContextmenu

$it.hideCompatibilityHelper = 1
