# Script para salvar todos os nomes dos arquivos de um diretório específico. O programa ainda não está completo.

function GetHeader {
    Write-Host "***************************`n****    Dir Scrapper   ****`n***************************`n*************** - By MB"
}

clear

GetHeader

ls | Out-File -FilePath .\logfile.txt -Append



