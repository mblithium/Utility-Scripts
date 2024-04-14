# Autoshutdown

Script para desligar computadores em horários especificados utilizando o Agendador de Tarefas do Windows.

## Criando tarefas para desligamento

Utilize o seguinte bloco de comandos para criar uma nova tarefa, substituindo os valores para a finalidade desejada:
```powershell
$TASKNAME="Autodesligar maquinas seg - sex"
$TIMETOSHUTDOWN="22:00pm"
$PERIOD=@("Monday","Tuesday","Wednesday","Thursday","Friday")
SetSchedule $TASKNAME $TIMETOSHUTDOWN $PERIOD
```

### $TASKNAME 
Nome da tarefa que será criada, contendo a descrição do que ela faz.

### $TIMETOSHUTDOWN 
O horário especificado para o desligamento da máquina.

### $PERIOD 
Um array com dias da semana que o script será executado. Aceita os valores em inglês:

- "Monday": Segunda-feira;
- "Tuesday": Terça-feira;
- "Wednesday": Quarta-feira;
- "Thuesday": Quinta-feira;
- "Friday": Sexta-feira;
- "Saturday": Sábado;
- "Sunday": Domingo;

Note que para colocar mais de um valor é necessário ser um array.

## Lidando com permissões de execução

Pode ser que a execução de scripts powershell esteja desabilitada por padrão, sendo necessário adicionar permissão para esse tipo de execução:

- Abra o Powershell ou o Powershell ISE como Administrador.
- Digite o seguinte comando:

```powershell
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope LocalMachine -Force
```

Basta selecionar a opção "A" para todos os scripts ou "Y" apenas para sessão atual do terminal do powershell.

## Instalando remotamente

Em vez de baixar o arquivo, é possível baixar e executar diretamente no powershell usando este comando:

```powershell
irm https://raw.githubusercontent.com/mblithium/Utility-Scripts/main/Windows/AutoShutdown/autoshutdown-install.ps1 | iex
```