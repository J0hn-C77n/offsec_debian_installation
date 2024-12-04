#!/bin/bash

# function zone
function initial_update_and_upgrade {                                                       
sudo apt update -y; sudo apt full-upgrade -y \                                               
# installing basic packages for comfortable work if they're missing in default Debian         
sudo apt install wget curl git vim btop neofetch tmux powertopi net-tools flatpak exiftool -y
}                                                                                             


function helper_tools {                                                                       
# additional tools for understanding linux and not remembering all the stuff                  
flatpak install io.github.ronniedroid.concessio \ # this is for priveledges                   
me.iepure.devtoolbox \ # this is for development stuff                                        
com.felipekinoshita.Wildcard -y \ # this is for regexp                                        
}                                                                                             


#GNOME SPACE IS HERE
function gnome_packages {
flatpak install org.gnome.Extensions -y

}
# end of fucntion zone

echo "Before we begin, you should know that this script is mainly developed for GNOME and includes flatpaks"
echo "If you're okay with it - we may continue. Otherwise assume to rewrite it or set your system manualy"
echo ""
echo "would you like to use default installation?"
echo "Y/n"



read default_installation


default_installation=$(echo "default_installation" | tr '[:uppper:]' '[:lower:]')

if [[ -z "$default_installation" || "$default_installation" == "y" || "$default_installation" == "yes" ]]; then
	echo "Starting default installation" 
	echo ""
	
	initial_update_and_upgrade
	
	# all fucntions without gui
	
elif [[ "$default_installation" == "n" || "$default_installation" == "no" ]]; then
	echo "Please specify what you would like to install"

	# need more scripting here!!!!!
	
else
	echo "would you like to use default installation?"
	echo "Y/n"
fi





	# To-do
	# add cycles and wariables for this code so you can split hacking, core, art and code into different subfolders
	# add some additional instruments in /opt/ directory
	# add "next-stable" source list because bookworm does not contain a lot of packages that you rely on
	# add your .bashrc and .aliasrc(?) so you can use alias that you use dayli
	# add some office and gui stuff as well as some games (like Minecraft) and markdown readers	
	



		# sudden idea to leave this pseudocode and declare these "gui" and "cli" into variable so you can change it and install all the thing you want rewriting pseudocode
	# pseudo-code zone:
	# 
	# update system
	#
	# ask if next-stable wanted (also give oppurtunity to get sid)
	# change /etc/apt/source.list to next-stable (+ sid)
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
