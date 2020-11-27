#!/bin/bash
# Script Bash para organizar o diretório de Downloads.
# MB_Lithium

AODEFAULTDIR=$HOME/Downloads/
echo $AODEFAULTDIR
cd $AODEFAULTDIR
# ls

function createDirs {
    mkdir Images | mkdir Videos | mkdir Musics | mkdir Packages | mkdir Documents | mkdir Compressed | mkdir DiskImages | mkdir Others
    echo Pastas criadas.
}

function Organizer {
    # Linux Packages
    mv *.deb $AODEFAULTDIR/Packages
    # Images
    mv *.png $AODEFAULTDIR/Images | mv *.gif $AODEFAULTDIR/Images | mv *.jpg $AODEFAULTDIR/Images | mv *.jpeg $AODEFAULTDIR/Images
    # Videos
    mv *.mp4 $AODEFAULTDIR/Videos
    # Musics
    mv *mp3 $AODEFAULTDIR/Musics
    # Documents
    mv *.pdf $AODEFAULTDIR/Documents | mv *.ods $AODEFAULTDIR/Documents
    # Compressed files
    mv *.zip $AODEFAULTDIR/Compressed | mv *.7z $AODEFAULTDIR/Compressed | mv *.rar $AODEFAULTDIR/Compressed | mv *.tar.gz $AODEFAULTDIR/Compressed | mv *.tar.xz $AODEFAULTDIR/Compressed
    # DiskImages
    mv *.iso $AODEFAULTDIR/DiskImages
    # Others
    mv *.exe $AODEFAULTDIR/Others | mv *.msi $AODEFAULTDIR/Others
}

# createDirs
# Organizer
