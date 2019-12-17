#! /bin/sh

install_packages() {
	# Stow
	sudo apt-get -y install stow

	# SSH
	if [ ! -f ~/.ssh/id_rsa ]; then
		echo "Configuring SSH"
		# Generate key
		ssh-keygen -t rsa -b 4096 -C info.lanvink@gmail.com -A
		# Add the key to the ssh-agent
		ssh-add ~/.ssh/id_rsa
	fi

	# Git
	echo "Installing git"
	sudo apt-get -y install git

	# i3
	echo "Installing i3"
	sudo apt-get -y install i3
	sudo apt-get -y install feh
	sudo apt-get -y install dmenu

	# URxvt
	echo "Installing URxvt"
	sudo apt-get -y install rxvt-unicode
}

stow_all(){
	# Stow once and get conflicts
	echo "Searching conflicts while linking"
	conflicts=""
	for dir in `ls -d */`; do
		conflicts="$conflicts`stow $dir -t ~ 2>&1 >/dev/null | grep \* | grep -oE '[^ ]+$'`"
		conflicts="$conflicts "
	done

	# Resolve conflicts by moving old config files to ~/backup-config dir
	echo "Backup old config files"
	mkdir -p ~/backup-config
        for file in $conflicts; do
                mkdir -p ~/backup-config/`dirname $file`
                mv -f ~/$file ~/backup-config/$file
        done

	# Restow
	echo "Symlinking config files"
	for dir in `ls -d */`; do
		stow $dir -t ~ --restow
	done
	echo "Symlinking done"
	echo "Original config files have been moved to ~/backup-config"
}

stow_all
