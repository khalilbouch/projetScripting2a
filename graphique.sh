source functions.sh 

gui(){
    action=$(yad --width 500 --entry --title="Caratéristiques"  \
    --image=system-search \
    --button="gtk-save:2" \
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
    Memory*) ( yad --text-info memoire);;
    CPU*) cpu ;;
    Linux*) version ;;
    Help*) help ;;
    *) exit 1 ;;  
esac
}