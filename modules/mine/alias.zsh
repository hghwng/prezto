alias xcpath='echo $PWD | pbc'

alias gbkunzip='unzip -O gb2312'
alias gbkftp='lftp -e "set ftp:charset gbk"'
alias cal='cal -3m'
alias wine='WINEDLLOVERRIDES=winemenubuilder.exe=d wine'
alias 7za='7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m'

alias t="~/tmp/; ls -lht"
alias z="fasd_cd"

alias l="ls -lh"
alias free='free -h'
alias rm="rm -I"
alias du="du -hd1"
alias dud="du -hd0"
alias bye="bg; disown; exit"

alias -g p="proxychains"
alias -g CL=' "$(pbp)"'
alias -g IC="| enconv -L zh_CN -x UTF-8"
alias -g WL="| wc -l "
alias -g HDC="| hexdump -C "
alias -g X="| xargs -I{} "
alias -g G='| grep -e'
alias -g GI='| grep -ei'
alias -g U='| uniq'
alias -g S='| sort'
alias -g SP='| sponge'

alias -g NUL='>/dev/null'
alias -g H='| head'
alias -g T='| tail'
alias -g L='| less'
alias -g LL='2>&1 | less'
