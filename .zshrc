bindkey -e # emacs key bindings
if [[ "${terminfo[kcbt]}" != "" ]]; then
    bindkey "${terminfo[kcbt]}" reverse-menu-complete   # [Shift-Tab] - move through the completion menu backwards
fi

# highlight tab
zstyle ':completion:*' menu selecto

source ~/.zsh_plugins.sh
source "$HOME/.aliases.zsh"

#------------------------------------------
#--- History
#-----------------------------------------
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.

HISTFILE=$HOME/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

source $HOME/.cargo/env # TODO needed?
eval "$(fnm env --multi --use-on-cd)"

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

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
    # export SDKMAN_DIR="/Users/adh23/.sdkman"
    # [[ -s "/Users/adh23/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/adh23/.sdkman/bin/sdkman-init.sh"
