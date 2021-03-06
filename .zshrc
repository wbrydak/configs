export ZSH=$HOME/.oh-my-zsh
export XDG_CONFIG_HOME=$HOME/.config/

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  node
  gatsby
  docker
  zsh-better-npm-completion
)

source $ZSH/oh-my-zsh.sh

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

if type gmake > /dev/null 2>&1; then
  alias make='gmake'
fi
if type gsed > /dev/null 2>&1; then
  alias sed='gsed'
fi


#load pure theme
autoload -U promptinit; promptinit
prompt pure

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -U +X bashcompinit && bashcompinit

complete -o nospace -C /usr/local/bin/terraform terraform

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export DOCKER_PS_FORMAT="\nID\t{{.ID}}\nIMAGE\t{{.Image}}\nCOMMAND\t{{.Command}}\nCREATED\t{{.RunningFor}}\nSTATUS\t{{.Status}}\nPORTS\t{{.Ports}}\nNAMES\t{{.Names}}\n"
export DOCKER_IMAGE_FORMAT="\nREPOSITORY\t{{.Repository}}\nTAG\t{{.Tag}}\nID\t{{.ID}}\nCREATED\t{{.CreatedSince}}\nSIZE\t{{.Size}}\n"
export DOCKER_NODE_FORMAT="\nID\t{{.ID}}\nHOSTNAME\t{{.Hostname}}\nSTATUS\t{{.Status}}\nAVAILABILITY\t{{.Status}}\nMANAGER\t{{.ManagerStatus}}\nENGINE VERSION\t{{.EngineVersion}}\n"
export DOCKER_SERVICE_PS_FORMAT="\nID\t{{.ID}}\nNAME\t{{.Name}}\nNODE\t{{.Node}}\nDESIRED\t{{.DesiredState}}\nCURRENT\t{{.CurrentState}}\nERROR\t{{.Error}}\nPORTS\t{{.Ports}}\n"
export DOCKER_SERVICE_LS_FORMAT="\nID\t{{.ID}}\nNAME\t{{.Name}}\nMODE\t{{.Mode}}\nREPLICAS\t{{.Replicas}}\nIMAGE\t{{.Image}}\nPORTS\t{{.Ports}}\n"

# docker formatting aliases
alias dkps='docker ps --format $DOCKER_PS_FORMAT'
alias dkpsa='docker ps -a --format $DOCKER_PS_FORMAT'
alias dkimg='docker image ls --format $DOCKER_IMAGE_FORMAT'
alias dknlist='docker node list --format $DOCKER_NODE_FORMAT'
alias dksps='docker service ps --format $DOCKER_SERVICE_PS_FORMAT'
alias dksls='docker service ls --format $DOCKER_SERVICE_LS_FORMAT'

alias pip='pip3'
export PATH="${PATH}:${HOME}/.local/bin/"
export PATH="${PATH}:${HOME}/Library/Python/3.9/bin/"
export PATH="${PATH}:${HOME}/.bin/"

alias wallshuf=$HOME/.local/scripts/wallpaper-switcher.sh
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh
# export HISTIGNORE='*sudo -S*:*docker login*'
setopt HIST_IGNORE_SPACE
# export HOMEBREW_NO_AUTO_UPDATE=1

alias rmwall=$HOME/.local/scripts/wallpaper-remove.sh
alias c="highlight -O ansi --force"
alias vnote="vim +Goyo"
alias pcreate=". pcreate"
alias sup="brew update -v && brew upgrade -v && brew upgrade --cask -v"
alias glow="glow -p"

mysql() {
	if [[ $@ == "start" ]]; then
		command brew services start mysql
	elif
		[[ $@ == "stop" ]]; then
		command brew services stop mysql
	elif
		[[ $@ == "restart" ]]; then
		command brew services restart mysql
	else
		command mysql $@
	fi
}

autoload -Uz hello_world
bindkey -v
