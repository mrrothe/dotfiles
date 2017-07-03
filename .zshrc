export ZSH=/home/martin/.oh-my-zsh
# Determine current OS
WINDOWS=false
if  [[ -a /mnt/c/Windows ]]; then
    WINDOWS=true
fi

ZSH_THEME="xiong-chiamiov-plus"
HYPHEN_INSENSITIVE="true"
export UPDATE_ZSH_DAYS=8
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

if $WINDOWS; then
	plugins=(screen sudo history) # Windows Plugins
else
	plugins=(screen sudo history) # Linux Plugins
fi

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='mvim'
fi

alias lss='ls -Glash'
alias snano='sudo nano'
alias nmap-quick='nmap -T4 -A -vv -sS '
alias zcat='zcat -f'
alias mount='mount |column -t'
alias tree='du -sh ./* | sort -hr'
alias space='df -h'
alias cp="rsync --progress -ravz"

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

if $WINDOWS; then
	chromepath="/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe"
else
	chromepath="/opt/google/chrome/chrome"
fi

function b64() {echo -n "$*" | base64 --decode}

function google() {eval "${chromepath} \"http://google.com/search?q=$@\""}

function otx() {eval "${chromepath} \"https://otx.alienvault.com/browse/pulses/?q=$@\""}

function dns() {
	host $@ |grep -Po 'has address \K[\d.]+' | head -n1
	if $WINDOWS; then
		host $@ |grep -Po 'has address \K[\d.]+' | head -n1 | clip.exe 2> /dev/null
	else
		host $@ |grep -Po 'has address \K[\d.]+' | head -n1 | clip.exe 2> /dev/null
	fi
}

function ipinfo() {eval "${chromepath} \"http://rothe.uk/share/ip/ip.html?ip=$@\""}
function myip(){host myip.opendns.com. resolver1.opendns.com |grep -Po 'has address \K[\d.]+'}
function cdl() { #Lists files when move to directory
  cd"$@";
  ls -al;
}

