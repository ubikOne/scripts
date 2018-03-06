#!/bin/bash

currentDate=$(date +"%F")

function servicetag() {
	echo "Podaj servicetag ( wielkimi literami )"
	read st
	touch ST_$st
}

function inst() {
	if [ ! -d "/INSTALL" ];
	then
		cd /
		mkdir INSTALL
		cd INSTALL
		mkdir INST-00
		mkdir INST-01
		mkdir INST-02
		mkdir INST-03
		mkdir INST-04
	fi
}

function initialCopy() {
	cp -rfv /root /INSTALL/INST-00/
	cp -rfv /etc /INSTALL/INST-00/
	cp -rfv /home /INSTALL/INST-00/
	cp -rfv /boot /INSTALL/INST-00/
}

function secondCopy() {
	cp -rfv /root /INSTALL/INST-01/
	cp -rfv /etc /INSTALL/INST-01/
	cp -rfv /home /INSTALL/INST-01/
	cp -rfv /boot /INSTALL/INST-01/
}

function sysoff() {
	systemctl stop firewalld
	systemctl disable firewalld
	systemctl status firewalld

	cp /etc/sysconfig/selinux /etc/sysconfig/selinux.backup
	sed -i "7s/SELINUX=enforcing/SELINUX=disabled/" /etc/sysconfig/selinux
}

function gdmoff() {
	systemctl disable gdm
	systemctl status gdm
}

function sysupdate() {
	yum update -y
}

function programInstallSerwer() {
	yum install epel-release -y
	yum install mc htop dos2unix nmap thunderbird thunderbird-adblock htop ntfs-3g a2ps wine -y
}

function programinstallkasa() {
	yum install epel-release -y
	yum install mc htop dos2unix nmap htop ntfs-3g -y
}

function end() {
	echo "
	Wstępna konfiguracja przebiegła poimyślnie
	za 5 sekund nastąpi ponowne uruchonienie komputera.
	Aby przerwać wciśnij ctrl-c
	"
	sleep 5
	shutdown -r now
}

function ask() {
  # https://djm.me/ask
  local prompt default reply

  while true; do

    if [ "${2:-}" = "Y" ]; then
      prompt="Y/n"
      default=Y
    elif [ "${2:-}" = "N" ]; then
      prompt="y/N"
      default=N
    else
      prompt="y/n"
      default=
    fi

    # Ask the question (not using "read -p" as it uses stderr not stdout)
    echo -n "$1 [$prompt] "

    # Read the answer (use /dev/tty in case stdin is redirected from somewhere else)
    read reply </dev/tty

    # Default?
    if [ -z "$reply" ]; then
      reply=$default
    fi

    # Check if the reply is valid
    case "$reply" in
      Y*|y*) return 0 ;;
      N*|n*) return 1 ;;
    esac

  done
}

function hosts() {
	echo "192.168.$1.1	sklep$1.serwer	serwer" >> /etc/hosts
	echo "192.168.$1.11	kasa1" >> /etc/hosts
	echo "192.168.$1.12	kasa2" >> /etc/hosts
	echo ""
	echo ""
}

function main() {
	echo "Numer Sklepu:"
	read numer

	echo " "
	if ask "Komputer marki DELL?";
		then
		servicetag
	fi

	inst

	PS3='Rodzaj instalacji: '
	options=("Kasa" "Serwer" "Wyjdź")
	select opt in "${options[@]}"
	do
		case $opt in
			"Kasa")
				echo "Numer Kasy"
				read numerKasy
				cd /INSTALL
				mkdir kasa$numerKasy
				cd kasa$numerKasy
				mkdir logs backup
				cd /
				echo "Konfiguracja kasy"
				initialCopy | tee -a /INSTALL/kasa$numerKasy/logs/pierwsza_kopia_$currentDate.log
				cp -rfv /etc/hosts /etc/hosts.backup
				cp -rfv /etc/hosts /INSTALL/kasa$numerKasy/backup/
				cp -rfv /etc/sysconfig/selinux /kasa$numerKasy/$dysk/backup/
				hosts $numer
				# echo "192.168.$numer.1	sklep$numer.serwer	serwer" >> /etc/hosts
				# echo "192.168.$numer.11	kasa1" >> /etc/hosts
				# echo "192.168.$numer.12	kasa2" >> /etc/hosts
				sysupdate | tee -a /INSTALL/kasa$numerKasy/logs/kasa_$currentDate.log
				sysoff | tee -a /INSTALL/kasa$numerKasy/logs/kasa_$currentDate.log
				gdmoff | tee -a /INSTALL/kasa$numerKasy/logs/kasa_$currentDate.log
				programinstallkasa | tee -a /INSTALL/kasa$numerKasy/logs/kasa_$currentDate.log
				secondCopy | tee -a /INSTALL/kasa$numerKasy/logs/druga_kopia_$currentDate.log
				cd /INSTALL
				tar -czvf $currentDate.tar.gz kasa$numerKasy
				end
			;;
			"Serwer")
				PS3='Który dysk znajduje się w komputerze: '
				options=("Dysk A" "Dysk B" "Dysk C" "Wyjdź")
				select opt in "${options[@]}"
				do
					case $opt in
						"Dysk A")
							echo "Wybrano dysk A"
							dysk=Dysk_A
							cd /INSTALL
							mkdir $currentDate
							cd $currentDate
							mkdir $dysk
							cd $dysk
							mkdir logs backup
							cd /
							mkdir A_TO_JEST_DYSK_A
							touch a_to_jest_dysk_a
							initialCopy | tee -a /INSTALL/$dysk/logs/pierwsza_kopia_$currentDate.log
							cp -rfv /etc/hosts /etc/hosts.backup
							cp -rfv /etc/hosts /INSTALL/$dysk/backup/
							cp -rfv /etc/sysconfig/selinux /INSTALL/$dysk/backup/
							echo "192.168.$numer.1	sklep$numer.serwer	serwer" >> /etc/hosts
							echo "192.168.$numer.11	kasa1" >> /etc/hosts
							echo "192.168.$numer.12	kasa2" >> /etc/hosts
							sysupdate | tee -a /INSTALL/$dysk/logs/serwer_$currentDate.log
							sysoff | tee -a /INSTALL/$dysk/logs/serwer_$currentDate.log
							programInstallSerwer | tee -a /INSTALL/$dysk/logs/serwer_$currentDate.log
							secondCopy | tee -a /INSTALL/$dysk/logs/druga_kopia_$currentDate.log
							tar -czvf $currentDate.tar.gz $dysk
							end
						;;
						"Dysk B")
							echo "Wybrano dysk B"
							dysk=Dysk_B
							cd /INSTALL
							mkdir $currentDate
							cd $currentDate
							mkdir $dysk
							cd $dysk
							mkdir logs backup
							cd /
							mkdir A_TO_JEST_DYSK_B
							touch a_to_jest_dysk_b
							initialCopy | tee -a /INSTALL/$dysk/logs/pierwsza_kopia_$currentDate.log
							cp -rfv /etc/hosts /etc/hosts.backup
							cp -rfv /etc/hosts /INSTALL/$dysk/backup/
							cp -rfv /etc/sysconfig/selinux /INSTALL/$dysk/backup/
							echo "192.168.$numer.1	sklep$numer.serwer	serwer" >> /etc/hosts
							echo "192.168.$numer.11	kasa1" >> /etc/hosts
							echo "192.168.$numer.12	kasa2" >> /etc/hosts
							sysupdate | tee -a /INSTALL/$dysk/logs/serwer_$currentDate.log
							sysoff | tee -a /INSTALL/$dysk/logs/serwer_$currentDate.log
							programInstallSerwer | tee -a /INSTALL/$dysk/logs/serwer_$currentDate.log
							secondCopy | tee -a /INSTALL/$dysk/logs/druga_kopia_$currentDate.log
							tar -czvf $currentDate.tar.gz $dysk
							end
						;;
						"Dysk C")
							echo "Wybrano dysk C"
							dysk=Dysk_C
							cd /INSTALL
							mkdir $dysk
							cd $dysk
							mkdir logs backup
							cd /
							mkdir A_TO_JEST_DYSK_C
							touch a_to_jest_dysk_c
							initialCopy | tee -a /INSTALL/$dysk/logs/pierwsza_kopia_$currentDate.log
							cp -rfv /etc/hosts /etc/hosts.backup
							cp -rfv /etc/hosts /INSTALL/$dysk/backup/
							cp -rfv /etc/sysconfig/selinux /INSTALL/$dysk/backup/
							echo "192.168.$numer.1	sklep$numer.serwer	serwer" >> /etc/hosts
							echo "192.168.$numer.11	kasa1" >> /etc/hosts
							echo "192.168.$numer.12	kasa2" >> /etc/hosts
							sysupdate | tee -a /INSTALL/$dysk/logs/serwer_$currentDate.log
							sysoff | tee -a /INSTALL/$dysk/logs/serwer_$currentDate.log
							programInstallSerwer | tee -a /INSTALL/$dysk/logs/serwer_$currentDate.log
							secondCopy | tee -a /INSTALL/$dysk/logs/druga_kopia_$currentDate.log
							tar -czvf $currentDate.tar.gz $dysk
							end
						;;
						"Wyjdź")
							break
						;;
						*) 
							echo invalid option
						;;
					esac
				done
				;;
				"Wyjdź")
					break
				;;
			*) echo 
				invalid option
			;;
		esac
	done
}

main
