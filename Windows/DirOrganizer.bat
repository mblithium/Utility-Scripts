@echo off
mode 80, 35
REM DEFININDO CODIFICACAO DE CARACTERES PARA UTF8
REM (Estranho que funciona perfeitamente no wine, mas no windows n?o)
REM Testado no WINDOWS 7
REM Digitado no KDE Kate :)
chcp 65001

REM DEFININDO UM TITULO PARA A JANELA
title Doc Organizer - By MB_Lithium

REM DEFINICOES
COLOR 02
set smode=Assistido
REM Assistido - Com confirmaÁoes e explicaÁoes. / Auto - Sem confirmaÁoes nem explicaÁoes.

REM SCRIPT CRIADO PARA ORGANIZAR PASTAS NO WINDOWS. ELE CRIA DIRETORIOS CATEGORIZADOS PARA CADA TIPO DE ARQUIVO.
REM ============================================================================================================
REM VER. 0.0.1
REM ===========

IF EXIST "%USERPROFILE%\¡Årea de Trabalho" (
 set desktop=¡Årea de Trabalho
) ELSE (
IF EXIST "%USERPROFILE%\Desktop" (
 set desktop=Desktop
) ELSE (
 echo Nada encontrado.
 pause
 exit
)
)

REM SETANDO VARIAÅVEL PARA CONTROLE
set localControl=PlaceHolder
goto %localControl%
goto PlaceHolder

:PlaceHolder
echo.
echo #####################################################################
echo #   ___  _______    ____  ___  ________   _  __________  _______    #
echo #  / _ \/  _/ _ \  / __ \/ _ \/ ___/ _ / / // /  _/_  / / __/ _ \   #
echo # / // _/ // , _/ / /_/ / , _/ (_ / __ //    _/ /  / /_/ _// , _/   #
echo #/____/___/_//_/  \____/_//_/\___/_/ /_/_//_/___/ /___/___/_//_/    #
echo #                                                                   #
echo #       _______                                                     #
echo #      /      // DIR Organizer                                      #
echo #     /      //         - By MB                                     #
echo #    /______//                                                      #
echo #   (______(/                                                       #
echo #                                                      VER. 0.0.1   #
echo #####################################################################
echo.
goto MAIN

:MAIN
echo =====================================================================
echo #
echo # Ola, eu irei criar uma organizacao de pastas em seu usuario
echo # do Windows. Isso sera bem util depois de uma formatacao, quando esta 
echo # tudo vazio. Mas claro, se nao for o caso, ele ainda funciona mas
echo # voce tera um trabalho para separar seus arquivos.
echo #
echo # Tambem irei colocar seus atalhos da AÅrea de Trabalho em uma Unica 
echo # pasta para voce conseguir organizar melhor depois. Alem de organizar seus 
echo # arquivos que estavam no Desktop para uma pasta nomeada de Desktop_Backup
echo # na pasta Documentos do Windows.
echo #
echo # Futuramente tera um menu para conseguir separar varios arquivos de 
echo # diferentes formatos para as pastas especificadas.
echo # Obs: Nao se preocupe, o script apenas cria pastas que nao existam. 
echo # Ele nao exclui nem modifica nada (pelo menos nesta versao).
echo #
echo =====================================================================
echo.
echo Seu usuario: %USERPROFILE%
echo.
REM echo Aperte ENTER ou qualquer tecla "nao reservada" para continuar...
pause
cls

goto POP
goto EXIT

:POP
cls
echo.
echo Irei criar as seguintes pastas:
echo =====================================================================
echo Documentos
echo    Estudos (PARA ESTUDOS)
echo    Biblioteca (PARA LIVROS E DOCUMENTOS)
echo Games
echo    PC (PARA JOGOS DE COMPUTADOR)
echo    Emuladores (PARA EMULADORES E ROMS)
echo        EMU... (EMULADORES DIVERSOS COM DUAS PASTAS PRINCIPAIS)
echo            EMULADORES (PARA OS EMULADORES)
echo            ROMS (PARA AS ROMS)
echo Downloads
echo    Instaladores (PARA ORGANIZAR INSTALADORES DE PROGRAMAS)
echo    Imagens (IMAGENS QUE FORAM BAIXADAS E AINDA NAO ORGANIZADAS)
echo    Programas (PROGRAMAS PORTABLE)
echo    Musicas (MUSICAS QUE FORAM BAIXADAS E AINDA NAO ORGANIZADAS)
echo    Documentos (DOCUMENTOS BAIXADOS E AINDA NAO ORGANIZADOS)
echo Imagens
echo    Wallpapers (PARA PAPEIS DE PAREDE)
echo    Screenshots (PARA CAPTURAS DE TELA)
echo    Fotos (PARA FOTOS)
echo Videos
echo    Filmes (PARA SALVAR FILMES)
echo    Videoclips (PARA VIDEOS)
echo    Meus Videoclips (PARA VIDEOS DE SUA AUTORIA)
echo =====================================================================
echo. 
pause
goto WORK
goto EXIT

:CONFIG


:WORK
cls
echo.
echo Criando pastas no diretorio de usuario: %USERPROFILE%
echo.
echo ...
REM DIRETORIO DE BACKUP DA AREA DE TRABALHO
md %USERPROFILE%\Documentos\Desktop_Backup
set backupdir="%USERPROFILE%\Documentos\Desktop_Backup"
md "%USERPROFILE%\%desktop%\Links_de_Atalho"
md %backupdir%\Musicas
md %backupdir%\Videos
md %backupdir%\Imagens
md %backupdir%\Documentos

REM DIRETORIO DE DOCUMENTOS
md %USERPROFILE%\Documentos
md %USERPROFILE%\Documentos\Estudos
md %USERPROFILE%\Documentos\Biblioteca

REM DIRETORIO DE IMAGENS
md %USERPROFILE%\Imagens
md %USERPROFILE%\Imagens\Fotos
md %USERPROFILE%\Imagens\Wallpapers
md %USERPROFILE%\Imagens\Screenshots

REM DIRETORIO DE VIDEOS
md %USERPROFILE%\Videos
md %USERPROFILE%\Videos\Filmes
md %USERPROFILE%\Videos\Videoclips
md "%USERPROFILE%\Videos\Meus Videoclips"

REM DIRETORIO DE DOWNLOADS
md %USERPROFILE%\Downloads
md %USERPROFILE%\Downloads\Instaladores
md %USERPROFILE%\Downloads\Programas
md %USERPROFILE%\Downloads\Imagens
md %USERPROFILE%\Downloads\Musicas
md %USERPROFILE%\Downloads\Documentos

REM DIRETORIO DE GAMES
md %USERPROFILE%\Games
md %USERPROFILE%\Games\PC
md %USERPROFILE%\Games\Emuladores
md %USERPROFILE%\Games\Emuladores\PSX
md %USERPROFILE%\Games\Emuladores\PSX\EMULADORES
md %USERPROFILE%\Games\Emuladores\PSX\ROMS
md %USERPROFILE%\Games\Emuladores\PS2
md %USERPROFILE%\Games\Emuladores\PS2\EMULADORES
md %USERPROFILE%\Games\Emuladores\PS2\ROMS
md %USERPROFILE%\Games\Emuladores\PS3
md %USERPROFILE%\Games\Emuladores\PS3\EMULADORES
md %USERPROFILE%\Games\Emuladores\PS3\ROMS
md %USERPROFILE%\Games\Emuladores\GBA
md %USERPROFILE%\Games\Emuladores\GBA\EMULADORES
md %USERPROFILE%\Games\Emuladores\GBA\ROMS
md %USERPROFILE%\Games\Emuladores\GB
md %USERPROFILE%\Games\Emuladores\GB\EMULADORES
md %USERPROFILE%\Games\Emuladores\GB\ROMS
md %USERPROFILE%\Games\Emuladores\DC
md %USERPROFILE%\Games\Emuladores\DC\EMULADORES
md %USERPROFILE%\Games\Emuladores\DC\ROMS
md %USERPROFILE%\Games\Emuladores\Wii
md %USERPROFILE%\Games\Emuladores\Wii\EMULADORES
md %USERPROFILE%\Games\Emuladores\Wii\ROMS
md %USERPROFILE%\Games\Emuladores\NDS
md %USERPROFILE%\Games\Emuladores\NDS\EMULADORES
md %USERPROFILE%\Games\Emuladores\NDS\ROMS
md %USERPROFILE%\Games\Emuladores\3DS
md %USERPROFILE%\Games\Emuladores\3DS\EMULADORES
md %USERPROFILE%\Games\Emuladores\3DS\ROMS
md %USERPROFILE%\Games\Emuladores\NES
md %USERPROFILE%\Games\Emuladores\NES\EMULADORES
md %USERPROFILE%\Games\Emuladores\NES\ROMS
md %USERPROFILE%\Games\Emuladores\SNES
md %USERPROFILE%\Games\Emuladores\SNES\EMULADORES
md %USERPROFILE%\Games\Emuladores\SNES\ROMS
md %USERPROFILE%\Games\Emuladores\MD
md %USERPROFILE%\Games\Emuladores\MD\EMULADORES
md %USERPROFILE%\Games\Emuladores\MD\ROMS
md %USERPROFILE%\Games\Emuladores\NEOGEO
md %USERPROFILE%\Games\Emuladores\NEOGEO\EMULADORES
md %USERPROFILE%\Games\Emuladores\NEOGEO\ROMS
md %USERPROFILE%\Games\Emuladores\NEOGEOPOCKET
md %USERPROFILE%\Games\Emuladores\NEOGEOPOCKET\EMULADORES
md %USERPROFILE%\Games\Emuladores\NEOGEOPOCKET\ROMS

cls
REM Movendo Area de Trabalho para um backup organizado.
move /Y "%USERPROFILE%\%desktop%\*.lnk" "%USERPROFILE%\%desktop%\Links_de_Atalho"

move /Y "%USERPROFILE%\%desktop%\*.mp3" "%backupdir%\Musicas"
move /Y "%USERPROFILE%\%desktop%\*.wav" "%backupdir%\Musicas"
move /Y "%USERPROFILE%\%desktop%\*.ogg" "%backupdir%\Musicas"
move /Y "%USERPROFILE%\%desktop%\*.aac" "%backupdir%\Musicas"

move /Y "%USERPROFILE%\%desktop%\*.mp4" "%backupdir%\Videos"
move /Y "%USERPROFILE%\%desktop%\*.wmv" "%backupdir%\Videos"
move /Y "%USERPROFILE%\%desktop%\*.mov" "%backupdir%\Videos"
move /Y "%USERPROFILE%\%desktop%\*.mkv" "%backupdir%\Videos"
move /Y "%USERPROFILE%\%desktop%\*.mpeg" "%backupdir%\Videos"
move /Y "%USERPROFILE%\%desktop%\*.avi" "%backupdir%\Videos"
move /Y "%USERPROFILE%\%desktop%\*.3gp" "%backupdir%\Videos"

move /Y "%USERPROFILE%\%desktop%\*.pdf" "%backupdir%\Documentos"
move /Y "%USERPROFILE%\%desktop%\*.txt" "%backupdir%\Documentos"
move /Y "%USERPROFILE%\%desktop%\*.xls*" "%backupdir%\Documentos"
move /Y "%USERPROFILE%\%desktop%\*.ppt*" "%backupdir%\Documentos"
move /Y "%USERPROFILE%\%desktop%\*.doc*" "%backupdir%\Documentos"

move /Y "%USERPROFILE%\%desktop%\*.png" "%backupdir%\Imagens"
move /Y "%USERPROFILE%\%desktop%\*.bmp" "%backupdir%\Imagens"
move /Y "%USERPROFILE%\%desktop%\*.jpg" "%backupdir%\Imagens"
move /Y "%USERPROFILE%\%desktop%\*.jpeg" "%backupdir%\Imagens"
move /Y "%USERPROFILE%\%desktop%\*.gif" "%backupdir%\Imagens"

move /Y "%USERPROFILE%\%desktop%\*" "%backupdir%"
echo.
cls
echo ====================================================================
echo Prontinho, pastas criadas! Terminei por aqui. Voce pode
echo apertar qualquer tecla para sair ou apenas fechar a janela.
echo ====================================================================
echo Tambem criei um local para guardar toda a desorganizacao da AÅrea de 
echo Trabalho. Fica na pasta Usuario\Documentos\Desktop_Backup 
echo Ele tenta separar tipos de arquivos, mas nao e perfeito.
echo.
echo Voce ja pode fechar esse assistente sem problemas. 
echo.
explorer %backupdir%
pause
goto EXIT

REM FEATURES
:DownloadOrganizer
REM Ira organizar a pasta de dowloads separando por tipos de arquivos.
goto EXIT

:EXIT
ENDLOCAL
echo.
exit
