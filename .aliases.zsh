#---------------------------------------------#
# EDITOR-ish
# -------------------------------------------#
alias vi="vim --noplugin" # vi is vim on mac anyway so this is a 'light' version
alias zz="vi ~/.zshrc" # open zsh
alias vv="vi ~/.vimrc" # open vim config
alias aa="vi ~/.aliases.zsh" # open aliases
alias codij="vim -c \"Codi javascript | let ale_enabled = 0\" dmp.javascript"

alias zr="source ~/.zshrc"
alias vo="vim \$(fzf)"
alias mvim="/Applications/MacVim.app/Contents/bin/mvim"
alias als="eval \$(cat ~/.aliases.zsh | grep \"^alias.\+=\\\"\" | fzf -i --header='[run:]' | sed -E \"s:alias.*\\\"(.*)\\\":\\1:\" )"

#---------------------------------------------#
# EMACS
# -------------------------------------------#
alias emacs-doom="rm ~/.emacs.d && ln -s ~/doom-emacs ~/.emacs.d"
alias emacs-adam="rm ~/.emacs.d && ln -s ~/emacs ~/.emacs.d"

alias ec="emacsclient -a \"\" -c -t"
alias ed="emacs --daemon"
alias eg="/Applications/Emacs.app/Contents/MacOS/Emacs"

#---------------------------------------------#
# HELPERS
# -------------------------------------------#
alias ctags="`brew --prefix`/bin/ctags"
alias grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'

alias ls='ls -pGF'
alias l='ls -lah'
alias lc='colorls -A --sd --gs'

alias pathis='echo $PATH | tr -s ":" "\n"'

alias portsinuse="lsof -i -p | grep -i 'listen'"
alias ports="echo lsof -i tcp:3000"

alias finder='open -a 'Finder' .'
alias butter='echo "Lucy says stop coding and relax 🐼"'

alias screen='export TERM=screen-256color && screen'

alias treee='tree src -I "*~"'

alias mcfuckoff='sudo /usr/local/McAfee/AntiMalware/VSControl stopoas'
alias yi='sudo /usr/local/McAfee/AntiMalware/VSControl stopoas && yarn install && sudo /usr/local/McAfee/AntiMalware/VSControl startoas'
alias watch_del="watchman watch-del-all"

#---------------------------------------------#
# RUNNERS
# -------------------------------------------#
alias bi="brew install"
alias brewup='brew update; brew doctor; brew upgrade; brew cleanup'
alias alert="osascript -e 'display notification \"Task Finished\" with title \"CMD\"'; afplay /System/Library/Sounds/Glass.aiff"
alias ser='python -m SimpleHTTPServer $1' # start server

#---------------------------------------------#
# RARE USE
# -------------------------------------------#
alias mkssh="openssl rsa -in ~/.ssh/id_rsa | openssl base64 | tr -d '\n' | pbcopy"
alias pipes="pipes.sh -f 60 -s 8"

#---------------------------------------------#
# NODE
# -------------------------------------------#
alias nps="echo \$(cat package.json | jq -S '.scripts' | fzf -i --header='[run:]')"
alias npc="rm -rf ./node_modules; npm cache clear; npm i"
alias npg="node_g_installs"
alias npl="npm -g ls --depth=0"
alias npl="npm -g ls --depth=0"
alias yy="eval \$(cat package.json | jq -S '.scripts' | sed '1d;$d' | fzf -i --header='[run:]' | sed -E \"s/\\\"(.*)\\\":.*/yarn run \\1/\" )"

#---------------------------------------------#
# DOCKER
# -------------------------------------------#
alias dock_ri='docker rmi $(docker images -a --filter=dangling=true -q)' #docker_clean_images
alias dock_rc='docker rm $(docker ps --filter=status=exited --filter=status=created -q)' #docker_clean_ps
alias dock_prune='docker system prune -a'
alias dcup='docker-compose up'
alias dcdn='docker-compose down'
alias dick="docker ps | grep '[a-z0-9]' | awk '{ print $1 }' | xargs docker kill"
alias dc="docker-compose config --services | fzf --multi | tr '\n' ' ' | xargs docker-compose up"

#---------------------------------------------#
# GIT
# -------------------------------------------#
alias gBranch='git rev-parse --abbrev-ref HEAD'
alias gignore="git rm -r --cached .; git add .; git commit -m '.gitignore is now working'"
alias gmm="git checkout master && git pull && git checkout - && git rebase master"
alias gcp="git cherry-pick"
alias gkill="git branch | grep -v \"master\" | xargs git branch -D"
alias gfuck='git fetch origin; git reset --hard origin ${gBranch}'
alias gnah="git reset --hard; git clean -df"
# alias gh="open -a '/Applications/Google Chrome.app' \`git remote -v | grep git@github.com | grep fetch | head -1 | cut -f2 | cut -d' ' -f1 | sed -e's/:/\//' -e 's/git@/http:\/\//'\`"
alias gr='git rebase -i HEAD~$1'
alias gclean="git clean -dfX"
alias gwip="git add . && git commit -nm 'wip'"
alias gl="git log --oneline master..HEAD"
alias gundo="git reset --soft HEAD~1 && git restore --staged ."

#---------------------------------------------#
# TMUXINATOR
# -------------------------------------------#
alias mux="tmuxinator start"
alias muxa="mux spages; mux exc;"
alias kmux="kill_tmux_session"

##############################################
# SKY
##############################################
alias uni="unicorn_build"

#---------------------------------------------#
# SPAGES
# -------------------------------------------#
alias spg="cd /users/adh23/service/sky-pages"
alias sps="pages start dev --apps mobile,mysky | lolcat"
alias spu="pages start dev --apps mobile-service | lolcat"
alias spt="mv .env .nenv; pages test unit -q; mv .nenv .env; alert"
alias spc="ctags -R apps/ && ctags -R -a src/"

alias spd="docker_deploy_nimbus"
alias spn="git pull; npm i; sps"

#---------------------------------------------#
# Pages-lib
# -------------------------------------------#
alias libg="cd /users/adh23/service/pages-lib"
alias libs="yarn storybook:start"
alias libw="yarn watch:pages-apps"
alias libt="yarn test --watch --coverage --changedSince=master"


alias libapollo="git cherry-pick 613033541867eb1b1f52d303b007d6193101aef2"
# build
alias liba="yarn build:apollo-content"
alias libo="yarn build:organisms"
alias libm="yarn build:molecules"

#---------------------------------------------#
# pages-apps
# -------------------------------------------#
alias pag="cd /users/adh23/service/pages-apps"
alias pas="yarn start:dev"

#---------------------------------------------#
# SKYPORT
# -------------------------------------------#
alias gqg="cd /users/adh23/service/skyport-graphql"
alias gqs="start_skyport"
# function gqs () { start_skyport "$1" | skyportJq }
alias gqt="skyport_test_modified_files"
alias gqc="ctags -R src/schema/"
alias gqv="compare_skyport_vault_keys"
function skyport() { cp "$HOME/service/skyport-graphql/.env.$1" "$HOME/service/skyport-graphql/.env.integration" }
alias gnuke="git clean -dfX"

#---------------------------------------------#
# OTHER
# -------------------------------------------#
alias ppp="start_ppp"
alias cs="slack chat send -tx '@Waldorf akamai delete cache https://static.skyassets.com/content-api/v1/mobile-service-hub/app' -ch 'C7Y53DL90'"

alias rux="watch -n0.2 slack chat send -tx 'PCOO?' -ch 'DDRFWGHDH'"
alias poco="watch -n0.2 slack chat send -tx 'PCOO?' -ch 'D35J9H880'"
# alias sam="slack chat send -tx ${SLACK_MESSAGE} -ch 'D3VFV16U8'"
alias graeme="slack chat send -tx 'built' -ch 'D3U9RFCE8'"
alias ste="watch -n0.2 slack chat send -tx 'ಠ_ಠ' -ch 'DAFGH3E79'"
alias jisql="rlwrap java -cp $HOME/jisql/target/jisql-jar-with-dependencies.jar:$HOME/jdbc/ojdbc8-12.2.0.1.jar com.xigole.util.sql.Jisql -driver oraclethin -c \; "
