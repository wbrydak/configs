export ZSH=$HOME/.oh-my-zsh

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


#load pure theme
autoload -U promptinit; promptinit
prompt pure

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -U +X bashcompinit && bashcompinit

complete -o nospace -C /usr/local/bin/terraform terraform

export HOMEBREW_NO_AUTO_UPDATE=1

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
