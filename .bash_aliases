# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias em='emacs -nw -f shell'
alias emx='emacsclient -t'
alias gn='gnuplot '

# to make clean and make
alias mcm='make clean && make'
# cd into the old directory
alias bd='cd "$OLDPWD"'

# Remove a directory and all files
alias rmd='/bin/rm  --recursive --force --verbose '

# Alias's for multiple directory listing commands
alias la='ls -Alh' # show hidden files
alias ll='ls -Fls' # long listing format

# Search command line history
alias h="history | grep "

# Search running processes
alias p="ps aux | grep "

# Search files in the current folder
alias f="find . | grep "

# Show current network connections to the server
alias ipview="netstat -anpl | grep :80 | awk {'print \$5'} | cut -d\":\" -f1 | sort | uniq -c | sort -n | sed -e 's/^ *//' -e 's/ *\$//'"

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

# Show all logs in /var/log
alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

# Alias's to show disk space and space used in a folder
alias diskspace="du -S | sort -n -r |more"

#Memory
alias meminfo='free -m -l -t'

# Show open ports
alias openports='netstat -nape --inet'

# Alias's for safe and forced reboots
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'

#update and upgrade in one command
alias update='sudo apt-get update && sudo apt-get upgrade'

# Git related
alias gs='git status'
alias gc='git commit'
alias gcam='git commit -am'
alias gpr='git pull -r'
alias ga='git add'
alias gp='git push'
alias gd='git  --no-pager diff'
alias gb='git branch'
alias gl='git log'
alias gco='git checkout'
alias gspp='git stash && git pull -r && git stash pop'

# Search process by name and highlight !
function psgrep() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }

# Search for files and page it
function search() { find . -iname "*$@*" ; }

# Docker related https://dev.to/bogicevic7/my-docker-aliases-cheat-sheet-4bo9

function dl-fn {
	docker logs -f $1
}

alias dim="docker images"
alias dps="docker ps"
alias dpsa="docker ps -a"
alias dcu="docker-compose up -d"
alias dcd="docker-compose down"
alias dl=dl-fn

extract () {
        for archive in $*; do
                if [ -f $archive ] ; then
                        case $archive in
                                *.tar.bz2)   tar xvjf $archive    ;;
                                *.tar.gz)    tar xvzf $archive    ;;
                                *.bz2)       bunzip2 $archive     ;;
                                *.rar)       rar x $archive       ;;
                                *.gz)        gunzip $archive      ;;
                                *.tar)       tar xvf $archive     ;;
                                *.tbz2)      tar xvjf $archive    ;;
                                *.tgz)       tar xvzf $archive    ;;
                                *.zip)       unzip $archive       ;;
                                *.Z)         uncompress $archive  ;;
                                *.7z)        7z x $archive        ;;
                                *)           echo "don't know how to extract '$archive'..." ;;
                        esac
                else
                        echo "'$archive' is not a valid file!"
                fi
        done
}

ftext ()
{
        # -i case-insensitive
        # -I ignore binary files
        # -H causes filename to be printed
        # -r recursive search
        # -n causes line number to be printed
        # optional: -F treat search term as a literal, not a regular expression
        # optional: -l only print filenames and not the matching lines ex. grep -irl "$1" *
        grep -iIHrn --color=always "$1" .
}

netinfo ()
{
        echo "--------------- Network Information ---------------"
        /sbin/ifconfig | awk /'inet addr/ {print $2}'
        echo ""
        /sbin/ifconfig | awk /'Bcast/ {print $3}'
        echo ""
        /sbin/ifconfig | awk /'inet addr/ {print $4}'

        /sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
        echo "---------------------------------------------------"
}

alias whatismyip="whatsmyip"
function whatsmyip ()
{
        # Dumps a list of all IP addresses for every device
        # /sbin/ifconfig |grep -B1 "inet addr" |awk '{ if ( $1 == "inet" ) { print $2 } else if ( $2 == "Link" ) { printf "%s:" ,$1 } }' |awk -F: '{ print $1 ": " $3 }';

        # Internal IP Lookup
        echo -n "Internal IP: " ; /sbin/ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'

        # External IP Lookup
        echo -n "External IP: " ; wget http://smart-ip.net/myip -O - -q
}