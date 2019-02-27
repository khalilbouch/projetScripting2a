memoire()
{
	sed -n '1p;2p;3p' /proc/meminfo
	echo ===================
}

cpu(){
	sed -n '5p;9p;13p;11p' /proc/cpuinfo
	echo ===================
}

version(){
	cut -d' ' -f 3 /proc/version
	echo ===================
}

help(){
	echo -lmem : afficher les informations en relation avec la memoire
	echo -lcpu : afficher les informations en relation avec le processeur
	echo -lkernel : afficher la version du noyau
	echo ===================	
}
