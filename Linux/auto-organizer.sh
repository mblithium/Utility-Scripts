#!/bin/bash
# Script Bash para organizar o diretório de Downloads.
# MB_Lithium

# Diretório onde o script irá executar
AODEFAULTDIR=$HOME/Downloads/
echo $AODEFAULTDIR
cd $AODEFAULTDIR

function createDirs {
    creatDir=('Images' 'Videos' 'Musics' 'Packages' 'Documents' 'Compressed' 'DiskImages' 'Others')
    for i in ${createDir[@]}; do
        mkdir $i
    done
    echo Pastas criadas.
}

function Organizer {
    # Linux Packages
    movexts=('deb' 'appimage' 'flatpakref')
    # Coloque as extensões neste array de cima.
    for i in ${movexts[@]}; do
        mv *.$i $AODEFAULTDIR/Packages
    done

    # Images
    movexts=('png' 'gif' 'mv' 'jpeg' 'jpg', 'webp')
    # Coloque as extensões neste array de cima.
    for i in ${movexts[@]}; do
        mv *.$i $AODEFAULTDIR/Images
    done

    # Videos
    movexts=('mp4' 'm4v' '3gp' 'mov')
    # Coloque as extensões neste array de cima.
    for i in ${movexts[@]}; do
        mv *.$i $AODEFAULTDIR/Videos
    done

    # Musics
    movexts=('mp3' 'wav' 'm4a' 'ogg' 'webm')
    # Coloque as extensões neste array de cima.
    for i in ${movexts[@]}; do
        mv *.$i $AODEFAULTDIR/Musics
    done

    # Documents
    movexts=('pdf' 'ods' 'doc' 'docx' 'txt')
    # Coloque as extensões neste array de cima.
    for i in ${movexts[@]}; do
        mv *.$i $AODEFAULTDIR/Documents
    done

    # Compressed files
    movexts=('zip' '7z' 'rar' 'tar.gz' 'tar.xz' 'tar.gz')
    # Coloque as extensões neste array de cima.
    for i in ${movexts[@]}; do
        mv *.$i $AODEFAULTDIR/Compressed
    done

    # DiskImages
    movexts=('iso' 'img')
    # Coloque as extensões neste array de cima.
    for i in ${movexts[@]}; do
        mv *.$i $AODEFAULTDIR/DiskImages
    done

    # Others
    movexts=('exe' 'msi' 'torrent')
    # Coloque as extensões neste array de cima.
    for i in ${movexts[@]}; do
        mv *.$i $AODEFAULTDIR/Others
    done

    clear
    echo "Tudo Pronto!"
}

# Executa as funções

# Cria os Diretórios necessários para cada tipo de arquivo.
createDirs

# Organizar por extensão os arquivos nas pastas que foram criadas.
Organizer
