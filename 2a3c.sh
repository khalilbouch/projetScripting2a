source graphique.sh

if [[ $# -eq 0 ]]; then
	menu
	else
		if [[ $1 = '-lmem' ]]; then
			memoire
		elif [[ $1 = '-lcpu' ]]; then
			cpu
		elif [[ $1 = '-lkernel' ]]; then
			version
		elif [[ $1 = '-lpart' ]]; then
			partition
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
					'-lpart' ) partition >> HistoriquePartition ;;
					*)		echo Commande erronée 
							exit ;;
				esac
			fi	
		fi
fi
