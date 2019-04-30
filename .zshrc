#------------------------------------------
#--- Exports
#-----------------------------------------
export ZSH=$HOME/.oh-my-zsh
export EDITOR='vim'

export PATH="$PATH:$HOME/.nodenv/shims"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.cargo/bin"

# JQ_COLORS=1;30:0;39:0;39:0;39:0;32:1;39:1;39
export JQ_COLORS="1;30:0;31:0;32:0;35:0;33:1;35:1;35"

#------------------------------------------
#--- Settings
#-----------------------------------------
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"
HIST_IGNORE_SPACE=true
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git)

if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi

#------------------------------------------
#--- Sources
#-----------------------------------------
source $ZSH/oh-my-zsh.sh
source $HOME/.asdf/asdf.sh
source $HOME/.cargo/env
source $HOME/enhancd/init.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# source zsh
# fpath=(~/PersonalConfigs/zsh/bin "${fpath[@]}")
# typeset -U PATH fpath # dedupe fpath

#------------------------------------------
export CONFIGS="$HOME/PersonalConfigs"
export PATH="$PATH:$CONFIGS/bin"
export ALIASES="$CONFIGS/zsh/aliases.zsh"
source $ALIASES
source "$CONFIGS/zsh/shortcuts.zsh"

for f in $CONFIGS/zsh/bin/*; do source $f; done
for f in $CONFIGS/scripts/*; do source $f; done
for f in $CONFIGS/tmuxinator/*; do ln -s -f $f ~/.tmuxinator; done
#------------------------------------------

#------------------------------------------
#--- Extend Terminal
#-----------------------------------------
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type d --exclude "{Library,Music,Applications,Pictures,Unity,VirtualBox VMs,WebstormProjects,Tools,node_modules,.git}"'
export FZF_CTRL_T_COMMAND='rg --files --no-messages --hidden --follow --glob "!.git/*" --glob "!**/*.lock"'

autoload -U promptinit; promptinit
prompt pure

#------------------------------------------
#--- Sky Stuff
#-----------------------------------------
if [[ $(whoami) =~ 'adh23' ]]; then
    export TOOLKIT_PATH="$HOME/Sky/toolkit"
    export SKY_SERVICE_FOLDER="$HOME/Service"
    export SKYPORT_GRAPHQL_DIR="$SKY_SERVICE_FOLDER/skyport-graphql"
    export SKY_SERVICE_DEV_TOOLS=$SKY_SERVICE_FOLDER/skymobile-service/dev-tools
    [ -r $SKY_SERVICE_DEV_TOOLS/.sky.sh ] && source $SKY_SERVICE_DEV_TOOLS/.sky.sh
fi

#------------------------------------------
#------------------------------------------
#--- DEPRECATED
#-----------------------------------------

# ZSH_THEME="spaceship"
# ZSH_CUSTOM=$HOME/PersonalConfigs/zsh_custom
# source $HOME/PersonalConfigs/spaceship-config.zsh

#------------------------------------------
#--- ALWAYS LAST
#-----------------------------------------
if [ -n "$PATH" ]; then
    old_PATH=$PATH:; PATH=
    while [ -n "$old_PATH" ]; do
        x=${old_PATH%%:*}       # the first remaining entry
        case $PATH: in
            *:"$x":*) ;;          # already there
            *) PATH=$PATH:$x;;    # not there yet
        esac
        old_PATH=${old_PATH#*:}
    done
    PATH=${PATH#:}
    unset old_PATH x
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="/Users/adh23/.sdkman"
# [[ -s "/Users/adh23/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/adh23/.sdkman/bin/sdkman-init.sh"
