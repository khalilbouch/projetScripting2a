source functions.sh 

gui(){
while [ 1 ] 
do
    action=$(yad --width 500 --entry --title="Caratéristiques"  \
    --image=system-search \
    --button="gtk-ok:0" --button="gtk-close:1" \
    --text "Veuillez choisir l'action:" \
    --entry-text \
    "Memory information" "CPU Information" "Linix Core Version" "Help")

    ret=$?

[[ $ret -eq 1 ]] && exit 0
	
if [[ $ret -eq 2 ]]; then
    echo saved
    exit 0
fi

case $action in
    Memory*)
        memoire >> tmp.txt
        yad --width=700 --height=200 --text-info --fore= red < tmp.txt 
        rm tmp.txt  
        ;;
    CPU*) cpu >> tmp.txt
        yad --width=700 --height=200 --text-info --fore= red < tmp.txt  
        rm tmp.txt
        ;;
    Linux*) versionx >> tmp.txt
        yad --width=700 --height=200 --text-info --fore= red < tmp.txt  
        rm tmp.txt
        ;;
    Help*) help >> tmp.txt
        yad --width=700 --height=200 --text-info --fore= red < tmp.txt  
        rm tmp.txt
        ;; 
    *) exit 1 ;;  
esac
done
}
