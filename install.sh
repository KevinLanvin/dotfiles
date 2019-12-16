#! /bin/sh

try_cmd()
{
	MY_CMD=$@
	eval $MY_CMD 1>/dev/null 2>&1
	if [ $? = 0 ]; then
		echo "OK"
	else
		echo "Failed"
	fi
}


# SSH
if [ ! -f ~/.ssh/id_rsa ]; then
	echo "Generating ssh key"
	# Generate key
	try_cmd ssh-keygen -t rsa -b 4096 -C info.lanvink@gmail.com -A
	# Add the key to the ssh-agent
	try_cmd ssh-add ~/.ssh/id_rsa
fi

# Git
echo "Installing git"
try_cmd sudo apt-get -y install git

# i3
echo "Installing i3"
try_cmd sudo apt-get -y install i3

# Copy config files
echo "Copying dotfiles"
try_cmd cp ./config/`ls -a config | sed '/^\.*$/d'` ~/

echo "Setup complete"
