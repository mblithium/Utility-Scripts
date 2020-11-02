@echo off
mode 80, 35
REM DEFININDO CODIFICACAO DE CARACTERES PARA UTF8
REM (Estranho que funciona perfeitamente no wine, mas no windows n„o)
chcp 65001

REM DEFININDO UM TITULO PARA A JANELA
title Doc Organizer - By MB_Lithium

REM DEFINICOES
COLOR 02
set smode=Assistido
REM Assistido - Com confirmaÁ?es e explicaÁ?es. / Auto - Sem confirmaÁ?es nem explicaÁoes.

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

REM SETANDO VARI√ÅVEL PARA CONTROLE
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
REM echo # Tambem irei colocar seus atalhos da AÅrea de Trabalho em uma Unica pasta para voce conseguir organizar melhor depois.
echo # Futuramente tera um menu para conseguir separar varios arquivos de 
echo # diferentes formatos para as pastas especificadas.
echo # Obs: Nao se preocupe, o script apenas cria pastas que nao existam. 
echo # Ele nao exclui nem modifica nada (pelo menos nesta versao).
echo #
echo =====================================================================
echo.
echo Seu usuario: %USERPROFILE%
echo.
REM echo Aperte ENTER ou qualquer tecla "n√£o reservada" para continuar...
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
md "%desktop%\Links_de_Atalho"

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
md %USERPROFILE%\Games\Emuladores\PS2
md %USERPROFILE%\Games\Emuladores\PS3
md %USERPROFILE%\Games\Emuladores\GBA
md %USERPROFILE%\Games\Emuladores\GB
md %USERPROFILE%\Games\Emuladores\DC
md %USERPROFILE%\Games\Emuladores\Wii
md %USERPROFILE%\Games\Emuladores\NDS
md %USERPROFILE%\Games\Emuladores\3DS
md %USERPROFILE%\Games\Emuladores\NES
md %USERPROFILE%\Games\Emuladores\SNES
md %USERPROFILE%\Games\Emuladores\MD
md %USERPROFILE%\Games\Emuladores\NEOGEO
cls
REM echo Movendo atalhos da √°rea de trabalho para uma pasta.
REM move "√Årea de Trabalho\*.lnk "AÅrea de Trabalho\Links_de_Atalho"
echo.

echo ====================================================================
echo Prontinho, pastas criadas! Terminei por aqui. Voce pode
echo apertar qualquer tecla para sair ou apenas fechar a janela.
echo ====================================================================
REM echo Tambem criei um local para guardar toda a desorganizacao da √Årea de 
REM echo Trabalho. Fica na pasta Usu√°rio\Documentos\Desktop_Backup 
REM echo Voce ja pode fechar esse assistente sem problemas. 
echo.
pause
goto EXIT

:EXIT
ENDLOCAL
echo.
exit
