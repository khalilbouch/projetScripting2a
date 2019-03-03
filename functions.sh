menu(){ 
	while [[ 1 ]]
	do
	echo 1 - Afficher les informations memoire 
	echo 2 - Afficher les informations processeur 
	echo 3 - Afficher la version du noyau linux
	echo 4 - Afficher les informations partitions
	echo 5 - Help
	echo 6 - Quitter

	echo "Donner votre choix"
	read a
	clear
		while [[ $a -le 0 || $a -ge 7  ]]
		do
			echo "Choix incorrecte"
			echo "donner votre choix"
			read a
		done
			case $a in
				1)	sousmenu ;;
				2)	cpu ;;
				3)	version ;;
				4)	partition ;;
				5)	help ;;
				6)  exit	
			esac 
	done
}

sousmenu()
{
	clear
	echo 1 - Memoire Totale
	echo 2 - Memoire Libre
	echo 3 - Memoire Disponible
	echo 4 - Menu Principale
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
			1)	memoireTotal ;;
			2)	memoireLibre ;;
			3)	memoireDisponible ;;
			4)	menu ;;
			5)	exit	
	esac
}

memoire(){
	date
	sed -n '1p;2p;3p' /proc/meminfo
	echo ===================
}

partition()
{
	date
	df -hT
	echo ===================
}

memoireTotal()
{
	date
	sed -n '1p' /proc/meminfo
	echo ===================
}

memoireLibre()
{
	date
	sed -n '2p' /proc/meminfo
	echo ===================
}

memoireDisponible()
{
	date
	sed -n '3p' /proc/meminfo
	echo ===================
}

cpu(){
	date
	sed -n '5p;9p;13p;11p' /proc/cpuinfo
	echo ===================
}

version(){
	date
	cut -d' ' -f 3 /proc/version
	echo ===================
}

help(){
	echo -lmem : afficher les informations en relation avec la memoire
	echo -lcpu : afficher les informations en relation avec le processeur
	echo -lkernel : afficher la version du noyau
	echo -lpart : afficher les partitions disques
	echo -s , -save : ajouter apres une commande pour enregistrer
	echo ===================	
}
