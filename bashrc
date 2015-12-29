
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -lh'

#PS1='\n\[\e[1;32m\]\u@\h:\w\[\e[0m\] $ '
# set a fancy prompt (non-color, overwrite the one in /etc/profile)
PS1='\n┌── \[\e[1;32m\]\u\[\e[m\] \[\e[1;30m\]@\[\e[m\] \[\e[1;34m\]$(hostname)\[\e[m\] \[\e[1;37m\](\w)\[\e[m\]\n└─> '

export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

shopt -s autocd
shopt -s checkwinsize

# Compile and execute a C source on the fly
csource() {
	[[ $1 ]]    || { echo "Missing operand" >&2; return 1; }
	[[ -r $1 ]] || { printf "File %s does not exist or is not readable\n" "$1" >&2; return 1; }
	local output_path=${TMPDIR:-/tmp}/${1##*/};
	gcc "$1" -o "$output_path" && "$output_path";
	rm "$output_path";
	return 0;
}

# Simple Calculator
calc() {
    echo "scale=3;$@" | bc -l
}

# IP Info
ipif() { 
    if grep -P "(([1-9]\d{0,2})\.){3}(?2)" <<< "$1"; then
	curl ipinfo.io/"$1"
    else
	ipawk=($(host "$1" | awk '/address/ { print $NF }'))
	curl ipinfo.io/${ipawk[1]}
    fi
    echo
}



# AUR Command-Not-Found
#[ -r /etc/profile.d/cnf.sh ] && . /etc/profile.d/cnf.sh
