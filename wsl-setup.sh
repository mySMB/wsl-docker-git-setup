#!/bin/bash

# Set up some output colors
source definecolors.sh

echo -e "${GREEN}"
echo 'Windows Subsystem for Linux (WSL) Bash Setup'
echo -e "${NOCOLOR}"
echo "This script configures WSL Bash for use with Docker and Git:"
echo ''
echo "* Creates .bashrc_wsl file that is sourced from .bashrc for customizing the bash"
echo "* Installs docker-ce, docker-compose and their dependencies for use on the commandline"
echo "* Adds a DOCKER_HOST environment variable in .bashrc_wsl to allow docker to connect to Docker for Windows"
echo "* Adds a symlink /c that points to the c drive shared by Docker for Windows so that docker paths work properly"
echo "* Adds a Git enabled prompt so that you can see Git branch information on the commandline"
echo "* Set the colors for ls so that directories are visually distinguishable from files by creating ~/.dircolors"
echo "* Sets the default directory when WSL Bash starts"
echo -e "${YELLOW}"
read -r -p "Continue? [y/N] " response
echo -e "${NOCOLOR}"
case "$response" in
    [yY][eE][sS]|[yY])         
        ;;
    *)
        exit
        ;;
esac

# RESET
# Clear ~/bashrc_wsl so that we start with a clean slate
rm ~/.bashrc_wsl

# INIT .BASHRC_WSL
./bashrc_wsl.sh

# DOCKER
./docker-install.sh

# GIT ENABLED PROMPT
./gitprompt-install.sh

# DIRCOLORS
./dircolors.sh

# DEFAULT START DIRECTORY
./defaultdir.sh

echo -e "${GREEN}"
echo WSL Bash Setup complete.
echo -e "${NOCOLOR}"

echo -e "${YELLOW}"
echo 'NOTE: Bash configuration changes will not be applied until WSL Bash is closed and restarted'
echo -e "${NOCOLOR}"
echo ''
