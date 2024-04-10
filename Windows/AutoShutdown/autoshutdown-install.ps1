# Desenvolvido por: Matheus Bastos
# https://github.com/mblithium
# 2024 - Licença MIT
# Script powershell para configurar desligamento automático das máquinas em um horário especificado.
# As tarefas são agendadas no Agendador de Tarefas do Windows.

[Console]::OutputEncoding = [Text.Encoding]::UTF8

# Selecione aqui o horário para desligamento:
$TIMETOSHUTDOWN="22:00 pm"

function SetSchedule {
    $Trigger = New-ScheduledTaskTrigger -Daily -At $TIMETOSHUTDOWN

    $Action = New-ScheduledTaskAction -Execute "C:\Windows\System32\shutdown.exe" -Argument "/s /f /t 0"

    $Principal = New-ScheduledTaskPrincipal -UserId "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount
 
    try {
        Register-ScheduledTask -TaskName "Autodesligar maquinas do laboratorio." -Trigger $Trigger -Action $Action -Principal $Principal
        Write-Host "Tarefa registrada com sucesso para o horário: $TIMETOSHUTDOWN."
    } catch {
        Write-Host "Um erro ocorreu ao tentar registrar a tarefa."
    }
    
}

function init {
    SetSchedule
}

init