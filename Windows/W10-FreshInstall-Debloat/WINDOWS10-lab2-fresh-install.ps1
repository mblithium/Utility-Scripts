# Desenvolvido por: Matheus Bastos
# 2024 - Licença MIT

$WIN_HKCU = "HKCU:\Software\Microsoft\Windows\"
$LOG_FILE = "winPosInstLogs.txt"

Get-Date | Out-File -FilePath ".\$LOG_FILE" -Encoding "utf8" -Append
Get-ExecutionPolicy | Out-File -FilePath ".\$LOG_FILE" -Encoding "utf8" -Append

# Reiniciar o Windows Explorer
function RestartWindowsExplorer {
    Stop-Process -Name explorer -Force
}

function SetEnergyOpctions {
    # Opções de Energia
    # Define como alto desempenho
    powercfg -SetActive SCHEME_MIN
}

function SetPerformanceOptions {
    # Desempenho - Desabilitar animações e recursos não usados

    # Desabilita efeitos de animação no Menu do Windows.
    Set-ItemProperty -Path "$WIN_HKCU\VisualEffects\MenuAnimation" -Name "DefaultApplied" -Value 0
}

function UninstallPackages {
    # DESABILITAR CORTANA
    # Desabilitar o ícone da cortana
    Set-ItemProperty -Path "$WIN_HKCU\CurrentVersion\Explorer\Advanced" -Name "ShowCortanaButton" -Value 0

    # Desativar e desinstalar Cortana
    Set-ItemProperty -Path "$WIN_HKCU\CurrentVersion\Cortana" -Name "IsAvailable" -Value 0
    Get-AppxPackage -AllUsers Microsoft.549981C3F5F10 | Remove-AppPackage 

    # Desinstalar app "Mixed Reality Portal"
    Get-AppxPackage -AllUsers Microsoft.MixedReality.Portal | Remove-AppPackage

    # Desinstalar app "Microsoft Maps"
    Get-AppxPackage -AllUsers Microsoft.WindowsMaps | Remove-AppPackage

    # Desinstalar app "Spotify"
    Get-AppxPackage -AllUsers SpotifyAB.SpotifyMusic | Remove-AppPackage

    # Desinstalar app "Linkedin"
    Get-AppxPackage -AllUsers 7EE7776C.LinkedInforWindows | Remove-AppPackage
}

function SetSettings {
    # Desabilita as atualizações automáticas do Windows Update
    # Este comando é útil para não haver problemas com atualizações indesejadas em ambientes que usam o Time Freeze, as atualizações serão feitas manualmente pela equipe de TI.
    sc.exe config wuauserv start= disabled # Ative novamente com "sc.exe config wuauserv start=auto".
}

function InitScript {
    SetEnergyOpctions
    SetPerformanceOptions
    UninstallPackages
    SetSettings
    RestartWindowsExplorer
}

# InitScript
