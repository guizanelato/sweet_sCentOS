# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	startx &&
	setxkbmap us intl &&
	xrdb ~/.Xresources
fi

# Personal Alias

## Libre Office
alias impress="./libreoffice/opt/libreoffice6.3/program/simpress"
