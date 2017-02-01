#!/bin/bash

function cpp {
        if test  -d "in"; then
            if test ! -d "out"; then
                    mkdir "out"
            fi
            pliczki=(./in/*.txt)
            count=${#pliczki[@]}
            for ((number=1; number<=count; number++)); do
                ./liczbyzaprzyjaznione $(pwd)/in/l$number.txt > ./out/lout$number.txt
            done
            echo "zakonczono przetwarzanie plikow"
        fi
}

function generujraport {
    if test -r "generator.py"; then
        
            if test  -d "in"; then
                if test ! -d "out"; then
                    cpp
                fi
                python3 "./generator.py"
                echo "wygenerowano raport"
            fi
       else
		echo "nie mam pliku .py. koncze prace."
    fi
}

function backup {
    if test -r "./raport.html" ; then
        if test ! -d "backup"; then
            mkdir "backup"
        fi
        cp "raport.html" "./backup/backup_`date +%Y_%m_%d_%H_%M_%S`"
        echo "Utworzono backup"
    fi
}

function pokazraport {
    if test -r "./raport.html" ; then
		echo "otwieram raport..."
        xdg-open "raport.html"
    fi
}

function pause(){
   read -p "$*"
}

wybor=666
while [ $wybor -ne 0 ]; do
    case $wybor in
    1)
        # cpp
        cpp
        wybor=666;
    ;;
    2)
        #python
        generujraport
        wybor=666;
    ;;
    3)
        #backup
        backup
        wybor=666;
    ;;
    4)
        #otworz raport
        pokazraport
        wybor=666;
    ;;
    *)
        #menu
        echo "Menu"
        echo "1. Uruchom program"
        echo "2. Wygeneruj raport"
        echo "3. Stworz backup"
        echo "4. Otwórz istniejacy raport"
        echo "0. wyjście"
        read wybor
    ;;
    esac
done
exit
