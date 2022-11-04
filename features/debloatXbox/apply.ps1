#Requires -RunAsAdministrator

Disable-BundledService XblAuthManager, XblGameSave, XboxGipSvc, XboxNetApiSvc
Disable-BundledTask XblGameSaveTask

Uninstall-BundledAppx @'
Microsoft.Xbox.TCUI
Microsoft.XboxIdentityProvider
Microsoft.XboxApp
Microsoft.XboxGameOverlay
Microsoft.XboxGamingOverlay
Microsoft.XboxSpeechToTextOverlay
'@
