alias pacSyu="sudo pacman -Syu"
alias pacSd="sudo pacman -S --asdeps"
alias pacS="sudo pacman -S"
alias pacDd="sudo pacman -D --asdeps"
alias pacRs="sudo pacman -Rs"
alias pacSc="sudo pacman -Sc"
alias pacSs="pacman -Ss"
alias pacSi="pacman -Si"
alias pacFs="pacman -Fs"
alias pacQi="pacman -Qi"
alias pacQo="pacman -Qo"
alias pacQl="pacman -Ql"
alias pacFl="pacman -Fl"
alias pacFs="pacman -Fs"
alias pacaur="AURDEST=/tmp/pacaur pacaur"

alias makepkg="PKGEXT='.pkg.tar' makepkg"

function pacQlb() {
    pacman -Ql $@ | grep /usr/bin/. | sed -e "s:^\(.*\) /usr/bin/\(.*\):\x1b[92m\1\x1b[0m \2:"
}
