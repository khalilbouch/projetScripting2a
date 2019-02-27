source graphique.sh

if [[ $# -eq 0 ]]; then
echo 1 - Afficher les informations memoire 
echo 2 - Afficher les informations processeur 
echo 3 - Afficher la version du noyau linux 
echo 4 - Help
echo 5 - Quitter

echo "Donner votre choix"
read a
clear
	while [[ $a -le 0 || $a -ge 6  ]]
	do
		echo "Choix incorrecte"
		echo "donner votre choix"
		read a
	done
		case $a in
			1)	memoire ;;
			2)	cpu ;;
			3)	version ;;
			4)	help ;;
			5)	exit	
		esac
	else
		if [[ $1 = '-lmem' ]]; then
			memoire
		elif [[ $1 = '-lcpu' ]]; then
			cpu
		elif [[ $1 = '-lkernel' ]]; then
			version
		elif [[ $1 = '-h' || $1 = '-help' ]]; then
			help
		elif [[ $1 = '-g' || $1 = '-G' ]]; then
			gui
		else
			echo Commande Erronée
		fi
		if [[ $# -eq 2 ]]; then
			if [[ $2 = '-s' || $2 = '-save' ]]; then
				case $1 in
					'-lmem')	memoire >> HistoriqueMemoire ;;
					'-lcpu')	cpu >> HistoriqueCpu ;;
					'-lkernel')	version >> HistoriqueVersion ;;
					*)		echo Commande erronée 
							exit ;;
				esac
			fi	
		fi
fi
