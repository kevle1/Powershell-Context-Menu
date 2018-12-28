#Remove-Item
#Remove-ItemProperty

$menu = 'Open Windows PowerShell Here as Administrator'
$command = "$PSHOME\powershell.exe -NoExit -NoProfile -Command ""Set-Location '%V'"""

'directory', 'directory\background', 'drive' | ForEach-Object {
    Remove-Item -Path "Registry::HKEY_CLASSES_ROOT\$_\shell" -Name runas\command -Force |
    Remove-ItemProperty -Name '(default)' -Value $command -PassThru |
    Remove-ItemProperty -Path {$_.PSParentPath} -Name '(default)' -Value $menu -PassThru |
    Remove-ItemProperty -Name HasLUAShield -Value ''
}