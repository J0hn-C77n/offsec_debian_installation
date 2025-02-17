#!/bin/bash

###############################################################################################################
###############################################################################################################
# variable zone
source_list_content=$'# trixie
deb http://deb.debian.org/debian trixie main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian trixie main contrib non-free non-free-firmware



# sid
deb http://deb.debian.org/debian sid main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian sid main contrib non-free non-free-firmware'


base_packages=$'wget curl git vim btop neofetch tmux powertop net-tools flatpak exiftool wireguard openvpn hyx' # this is the line where you can specify YOUR base packages that should be installed

flatpak_helper=$'me.iepure.devtoolbox
		com.felipekinoshita.Wildcard'
#io.github.ronniedroid.concessio # this is for priveledges
#com.felipekionshita.Wildcard is for regexp
#me.iepure.devtoolbox is a powerfull app that can do priveledges, cron and all other stuff (maybe even regexp).

code_helpers=$'pre-commit'
###############################################################################################################
# function zone
function initial_update_and_upgrade {
	if [ -z "$source_list_content" ]; then
		echo "Error: source_list_content is not defined." >&2
		return 1
	fi
	echo -e "$source_list_content" | sudo tee /etc/apt/sources.list

	# updating to trixie and sid versions
	sudo apt update && sudo apt full-upgrade -y

	# installing basic packages for comfortable work if they're missing in default Debian
	sudo apt install -y $base_packages

}

function helper_tools {
	# additional tools for understanding linux and not remembering all the stuff
	flatpak install
}

#GNOME SPACE IS HERE
function gnome_packages {
	flatpak install org.gnome.Extensions -y

}
# end of fucntion zone
###############################################################################################################
###############################################################################################################

echo "Before we begin, you should know that this script is mainly developed for GNOME and includes flatpaks"
echo "If you're okay with it - we may continue. Otherwise assume to rewrite it or set your system manualy"
echo ""
echo "would you like to use default installation?"
echo "Y/n"
read default_installation

default_installation=$(echo "default_installation" | tr '[:uppper:]' '[:lower:]')

if [[ -z $default_installation || $default_installation == "y" || $default_installation == "yes" ]]; then
	echo "Starting default installation"
	echo ""

	initial_update_and_upgrade

	# all fucntions without gui

elif [[ $default_installation == "n" || $default_installation == "no" ]]; then
	echo "Please specify what you would like to install"

	# need more scripting here!!!!!

else
	echo "would you like to use default installation?"
	echo "Y/n"
fi

# To-do
# add cycles and wariables for this code so you can split hacking, core, art and code into different subfolders
# add some additional instruments in /opt/ directory
# add "trixie" source list because bookworm does not contain a lot of packages that you rely on
# add your .bashrc and .aliasrc(?) so you can use alias that you use dayli
# add some office and gui stuff as well as some games (like Minecraft) and markdown readers

# pseudo-code zone:
#
# update system
#
# ask if trixie wanted (also give oppurtunity to get sid)
# change /etc/apt/source.list to trixie (+ sid)
#
#	upgrade system after editing source list
#
# install basic packages
#
# ask for "bloatware"
#	install office; help tools; ext. manager etc.
#
#
#
# ask if preffer gui over cli
# yes: try to use gui tools like vscode, sublime, all the thing with gui
#
# ask for dev tools installation
# (Y\n\(c)li tools added)
#
# 	*gui*
# 	sublime vscode postman zed(?) wxhexeditor
#
# 	*cli*
# 	neovim hyx
#
# ask for general pentesting tools
# (Y\n\(c)li tools added)
#
# 	*gui*
# 	fern zaproxy
#
# ask for entertainment tools
# 	steam, lutris, all this stuff
#
#
# ask for virtualization
#	kvm, virtualbox
#
# ask for containers
# 	docker
#
#
#
# provide report of what have been installed and what people can do with it
# ask if person whatns to remove thsi scirp afterwards
