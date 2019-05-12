#!/bin/zsh
# Usage: codi [filetype] [filename]

codi() {
        local syntax="${1:-javascript}"
        shift
        vim -c \
                "let g:startify_disable_at_vimenter = 1 |\
                set bt=nofile ls=0 noru nonu nornu |\
                hi ColorColumn ctermbg=NONE |\
                hi VertSplit ctermbg=NONE |\
                hi NonText ctermfg=0 |\
                Codi $syntax" "javascript"
}

codij() {
        # vim -c "set bt=nofile | Codi javascript" dmp.javascript
        vim -c "Codi javascript | let ale_enabled = 0" dmp.javascript
}
