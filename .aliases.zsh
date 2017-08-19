#---------------------------------------------#
# GITHUB
# -------------------------------------------#

alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gf="git fetch"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gcom="git checkout master"
alias gd="git diff"
alias gda="git diff head"
alias gi="git init"
alias gl="git log"
alias glg="git log --graph --oneline --decorate --all"
alias gld="git log --pretty=format:"%h %ad %s" --date=short --all"
alias gm="git merge --no-ff"
alias gp="git pull"
alias gs="git status"
alias gss="git status -s"
alias gst="git stash"
alias gstl="git stash list"
alias gstp="git stash pop"
alias gstd="git stash drop"
alias grh="git reset --hard"
alias grhm="git reset --hard origin/master"

alias gln="git log -n" #add a number for how many commits you want
# alias glo="git log --graph --pretty=format:'%cred%h%creset -%c(yellow)%d%creset %s %cgreen(%cr) %c(bold blue)<%an>%creset' --abbrev-commit --date=relative"
alias gsl="git stash list --pretty=format:'%cred%h%creset -%c(yellow)%d%creset %s %cgreen(%cd)' --abbrev-commit --date=local"
# alias git stash list="git stash list --pretty=format:'%cred%h%creset -%c(yellow)%d%creset %s %cgreen(%cd)' --abbrev-commit --date=local"

#---------------------------------------------#
# UTILS
# -------------------------------------------#
alias npmrebuild="rm -rf ./node_modules; npm cache clear; npm i"

alias zshe="vim ~/.zshrc"
alias zshr="source ~/.zshrc"
alias portsinuse="lsof -i -p | grep -i 'listen'"

alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
#---------------------------------------------#
# TMUXINATOR
# -------------------------------------------#

alias allthethings="mux shared; mux pd d; mux sky"
# alias mux="tmuxinator start"
alias lt="tmux ls"
alias kmux="kill_tmux_session"

#---------------------------------------------#
# SKY
# -------------------------------------------#
# scripts
# -------------------------------------------#
alias cfViewAll=""
alias ppp="start_ppp"
alias skyport="start_skyport"
alias spages="start_spages"
alias mux="tmuxinator_app_with_params"

# alias stest="mv .env .notenv || true  && npm run test:unit || true && mv .notenv .env"
alias stest="pages test --no-bail unit"
alias portkeys="colordiff -u  <(awk -f'\"' '/\"/ { print \$2 }' vault-keys.json | sort -u) <(cut -d'=' -f1 .env.integration | sort -u) "

alias cdp="cd /users/adh23/service/sky-pages"
alias cds="cd /users/adh23/service/skyport-graphql"

#---------------------------------------------#
# MISC
# -------------------------------------------#
alias ef="exercism fetch"
alias es="exercism submit"

function tab-title() {
  echo -e "\033];$1\007"
}
