# Desenvolvido por: Matheus Bastos
# https://github.com/mblithium
# 2024 - Licença MIT
# Script powershell para configurar desligamento automático das máquinas em um horário especificado.
# As tarefas são agendadas no Agendador de Tarefas do Windows.

Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope LocalMachine
$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'

function SetSchedule {
    param (
        $TASKNAME,
        $TIMETOSHUTDOWN,
        $PERIOD
    )

    if (Get-ScheduledTask -TaskName $TASKNAME) {
        Write-Host "A tarefa ja existe, será substituida pela atual."
        Unregister-ScheduledTask -TaskName $TASKNAME -Confirm:$false
    }

    $Trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek $PERIOD -At $TIMETOSHUTDOWN

    $Action = New-ScheduledTaskAction -Execute "C:\Windows\System32\shutdown.exe" -Argument "/s /f /t 0"

    $Principal = New-ScheduledTaskPrincipal -UserId "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount
 
    try {
        Register-ScheduledTask -TaskName $TASKNAME -Trigger $Trigger -Action $Action -Principal $Principal
    } catch {
        Write-Warning "Um erro ocorreu ao tentar registrar a tarefa."
    }
}

function init {
    $TASKNAME="Autodesligar máquinas lab inf seg - sex"
    $TIMETOSHUTDOWN="22:00pm"
    $PERIOD=@("Monday","Tuesday","Wednesday","Thursday","Friday")
    SetSchedule $TASKNAME $TIMETOSHUTDOWN $PERIOD

    $TASKNAME="Autodesligar máquinas lab inf sab"
    $TIMETOSHUTDOWN="12:00pm"
    $PERIOD=@("saturday")
    SetSchedule $TASKNAME $TIMETOSHUTDOWN $PERIOD
}

init