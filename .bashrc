# Author Wajih
# If not running interactively, don't do anything
umask 0002
case $- in
    *i*) ;;
      *) return;;
esac

# Disable the bell
if [[ $iatest > 0 ]]; then bind "set bell-style visible"; fi

# Allow ctrl-S for history navigation (with ctrl-R)
stty -ixon

# # To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1

# Ignore duplicates, ls without options and builtin commands
HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"

# append to the history file, don't overwrite it
shopt -s histappend
PROMPT_COMMAND='history -a'

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
    echo "Sourcing bash_aliases *"
fi

# Alias definitions.
if [ -f ~/.bash_private ]; then
    . ~/.bash_private
fi

export PS1="\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

if [ "$(uname)" == "Darwin" ]; then
    # export JAVA_HOME="$(/usr/libexec/java_home -v 11)"
    export JAVA_HOME=$(/usr/libexec/java_home -v 1.8.0_121)
    function title {
	echo -ne "\033]0;"$*"\007"
    }
    title "[home]"
fi

if [ "$(uname)" == "Linux" ]; then
    function title {
	echo -ne "\033]0;"$*"\007"
    }
    title "[Linux]${HOSTNAME}"
fi
export TERM=xterm-256color
export BASH_SILENCE_DEPRECATION_WARNING=1

