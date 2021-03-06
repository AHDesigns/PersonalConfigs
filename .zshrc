# Only read by interactive shells
# i.e only put in stuff that helps with typing commands etc
# https://blog.flowblok.id.au/2013-02/shell-startup-scripts.html

# this has some tips on speeding up zsh
# https://htr3n.github.io/2018/07/faster-zsh/

#------------------------------------------
#--- ZSH settings
#-----------------------------------------
bindkey -e # emacs key bindings
if [[ "${terminfo[kcbt]}" != "" ]]; then
    bindkey "${terminfo[kcbt]}" reverse-menu-complete   # [Shift-Tab] - move through the completion menu backwards
fi

# highlight tab
zstyle ':completion:*' menu selecto

# fix for navigation keys in IDEA terminal
if [[ "$TERMINAL_EMULATOR" == "JetBrains-JediTerm" ]]; then
  bindkey "∫" backward-word # Option-b
  bindkey "ƒ" forward-word  # Option-f
  bindkey "∂" delete-word   # Option-d
fi

#------------------------------------------
#--- ZSH History
#-----------------------------------------
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.

HISTFILE=$HOME/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

#------------------------------------------
#--- terminal specific envs and aliases
#-----------------------------------------
# Prompt https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/
NEWLINE=$'\n' # couldn't get the newline to behave without this
PROMPT="${NEWLINE}%F{cyan}%~${NEWLINE}%(?.%F{magenta}ᕕ(ᐛ)ᕗ.%F{red}(╯°□°%)╯︵ ┻━┻) %F{normal}"
# time
# RPROMPT='%F{yellow}%*'

ssource ~/.zsh_plugins.sh
ssource ~/.fzf.zsh
ssource "$HOME/.aliases.zsh" # TODO: move?

# set up colors for ls, fd, tree etc https://github.com/sharkdp/vivid
# ssource ~/.config/vivid/built/snazzy.sh
export JQ_COLORS="1;30:0;31:0;32:0;35:0;33:1;35:1;35"

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# quickest way to cd around
export FZF_ALT_C_COMMAND="fd --type d --exclude '{Library,Music,Applications,Pictures,Unity,VirtualBox VMs,WebstormProjects,Tools,node_modules,.git}' . ${HOME}"

#------------------------------------------
#--- Language specific
#-----------------------------------------

# haskell
#-----------------------------------------
# source ~/.ghcup/env

# kubernetes
#-----------------------------------------
# this is huge so better to get when doing k8 stuff
# ssource ~/completions/zsh/kubectl.zsh

# if i alias to k, can do this
# echo 'alias k=kubectl' >>~/.zshrc
# echo 'complete -F __start_kubectl k' >>~/.zshrc

# gcloud
#-----------------------------------------
gcloud() {
  ssource "$HOME/google-cloud-sdk/completion.zsh.inc"
  # The next line updates PATH for the Google Cloud SDK.
  ssource "$HOME/google-cloud-sdk/path.zsh.inc"
}

# java
#-----------------------------------------
# ssource '/usr/local/Cellar/jenv/0.5.3/libexec/libexec/../completions/jenv.zsh'
# https://github.com/jenv/jenv/issues/148 speed up ideas
jenvy() {
  # brew install rlwrap if this fails
  eval "$(jenv init -)"
}

## ruby
##-----------------------------------------
rbenv() {
  eval "$(command rbenv init -)"
  rbenv "$@"
}

#------------------------------------------
#--- Sky Stuff
#-----------------------------------------
if [[ $(whoami) =~ 'adh23' ]]; then
    ssource $SKY_SERVICE_DEV_TOOLS/.sky.sh
fi

# enable this and ~/.zshenv for profiling
# zprof

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
    # export SDKMAN_DIR="/Users/adh23/.sdkman"
    # [[ -s "/Users/adh23/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/adh23/.sdkman/bin/sdkman-init.sh"
# fnm
