#!/bin/bash
# Script Bash para organizar o diretório de Downloads.
# MB_Lithium
clear

# Diretório onde o script irá executar
AODEFAULTDIR=$HOME/Downloads/
echo $AODEFAULTDIR
cd $AODEFAULTDIR

function createDirs {
    createDir=('Images' 'Videos' 'Musics' 'Packages' 'Documents' 'Compressed' 'DiskImages' 'Others' 'Testando')
    for i in ${createDir[@]}; do
        if [[ ! -d "$AODEFAULTDIR/$i" ]]; then
            mkdir $i
        fi
    done
}

function Organizer {
    function verCreate() {
        order="$1"
        for i in ${movexts[@]}; do
                while true; do
                    # Checa se existe o diretório para a extensão. Caso não exista, irá criar.
                    local targetDir="$AODEFAULTDIR${createDir[$order]}/$i"
                    if [ -d "$AODEFAULTDIR/${createDir[$order]}/$i" ]; then
                        mv *.$i "$targetDir"
                        echo "$targetDir"
                        break
                    else
                        mkdir "$targetDir"
                        echo "criando diretório..."
                    fi
                done
        done
    }

    : '
        movexts: Coloque as extensões dos arquivos dentro desta lista;
        dirOrder: Selecione a ordem do contexto atual, do tipo de arquivo aqui. A ordem é a lista, que começa com 0 (elemento 1) em ordem crescente;
        verCreate: Executa a função com o contexto atual.
    '

    # CRIE OS GRUPOS ABAIXO:

    # Linux Packages
    
    movexts=('deb' 'AppImage' 'flatpakref')
    dirOrder=3
    verCreate $dirOrder 

    # Images
    movexts=('png' 'gif' 'jpeg' 'jpg' 'webp' 'exif')
    dirOrder=0
    verCreate $dirOrder

    # Videos
    movexts=('mp4' 'm4v' '3gp' 'mov')
    dirOrder=1
    verCreate $dirOrder

    # Musics
    movexts=('mp3' 'wav' 'm4a' 'ogg' 'webm')
    dirOrder=2
    verCreate $dirOrder

    # Documents
    movexts=('pdf' 'ods' 'doc' 'docx' 'txt')
    dirOrder=4
    verCreate $dirOrder

    # Compressed files
    movexts=('zip' '7z' 'rar' 'tar.gz' 'tar.xz' 'tar.gz')
    dirOrder=5
    verCreate $dirOrder

    # DiskImages
    movexts=('iso' 'img')
    dirOrder=6
    verCreate $dirOrder

    # Others
    movexts=('exe' 'msi' 'torrent' 'm3u' 'bin' 'html')
    dirOrder=7
    verCreate $dirOrder

    clear
}

function toLogs() {
    local timelog=`date +%d/%m/%Y" - "%H:%M:%S`
    echo "[ $timelog ] - $1" >> "$AODEFAULTDIR/auto-organizer.log"
}

# Executa as funções

# Cria os Diretórios necessários para cada tipo de arquivo.
createDirs

# Organizar por extensão os arquivos nas pastas que foram criadas.
Organizer
