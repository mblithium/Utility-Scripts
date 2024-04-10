# Desenvolvido por: Matheus Bastos
# 2024 - Licença MIT

$PSDefaultParameterValues['*:Encoding'] = 'utf8'
$WIN_HKCU_SOFTWARE = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion"
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

    # Desabilitar outros efeitos gráficos do Windows/Explorer
    Set-ItemProperty -Path "$WIN_HKCU_SOFTWARE\Explorer\VisualEffects\AnimateMinMax" -Name "DefaultApplied" -Value 0
    Set-ItemProperty -Path "$WIN_HKCU_SOFTWARE\Explorer\VisualEffects\ComboBoxAnimation" -Name "DefaultApplied" -Value 0
    Set-ItemProperty -Path "$WIN_HKCU_SOFTWARE\Explorer\VisualEffects\ControlAnimations" -Name "DefaultApplied" -Value 0
    Set-ItemProperty -Path "$WIN_HKCU_SOFTWARE\Explorer\VisualEffects\CursorShadow" -Name "DefaultApplied" -Value 0
    Set-ItemProperty -Path "$WIN_HKCU_SOFTWARE\Explorer\VisualEffects\DragFullWindows" -Name "DefaultApplied" -Value 0
    Set-ItemProperty -Path "$WIN_HKCU_SOFTWARE\Explorer\VisualEffects\DWMAeroPeekEnabled" -Name "DefaultApplied" -Value 0
    Set-ItemProperty -Path "$WIN_HKCU_SOFTWARE\Explorer\VisualEffects\DWMEnabled" -Name "DefaultApplied" -Value 0
    Set-ItemProperty -Path "$WIN_HKCU_SOFTWARE\Explorer\VisualEffects\AnimateMinMax" -Name "DefaultApplied" -Value 0
    Set-ItemProperty -Path "$WIN_HKCU_SOFTWARE\Explorer\VisualEffects\MenuAnimation" -Name "DefaultApplied" -Value 0
    Set-ItemProperty -Path "$WIN_HKCU_SOFTWARE\Explorer\VisualEffects\SelectionFade" -Name "DefaultApplied" -Value 0
    Set-ItemProperty -Path "$WIN_HKCU_SOFTWARE\Explorer\VisualEffects\TaskbarAnimations" -Name "DefaultApplied" -Value 0
    Set-ItemProperty -Path "$WIN_HKCU_SOFTWARE\Explorer\VisualEffects\TooltipAnimation" -Name "DefaultApplied" -Value 0
}

function UninstallPackages {
    # DESABILITAR CORTANA
    # Desabilitar o ícone da cortana
    Set-ItemProperty -Path "$WIN_HKCU_SOFTWARE\Explorer\Advanced" -Name "ShowCortanaButton" -Value 0
    # Desativar e desinstalar Cortana
    Set-ItemProperty -Path "$WIN_HKCU_SOFTWARE\Cortana" -Name "IsAvailable" -Value 0
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

function InstallScoop {
    # Scoop é um gerenciador de pacotes/programas para Windows, que imita um pouco o método de instalação de aplicativos através do terminal no Linux. Com o Scoop, é possível instalar, desinstalar e até atualizar facilmente programas de Windows no terminal.
    # Github do projeto: https://github.com/ScoopInstaller/Scoop#readme 
    # Site: https://scoop.sh/
    try {
        Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
        Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
    }
    catch {
        Write-Host "Ocorreu algum erro ao tentar instalar o Scoop no sistema."
        Write-Host $_.ScriptStackTrace
    }
}

function InstallPrograms {
    scoop bucket add extras
    scoop install extras/eclipse-java
}

function InitScript {
    SetEnergyOpctions
    SetPerformanceOptions
    UninstallPackages
    SetSettings
    RestartWindowsExplorer
}

InitScript
