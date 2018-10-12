alias pacSyu="sudo yay -Syu"
alias pacSd="sudo yay -S --asdeps"
alias pacS="sudo yay -S"
alias pacDd="sudo yay -D --asdeps"
alias pacRs="sudo yay -Rs"
alias pacSc="sudo yay -Sc"
alias pacSs="yay -Ss"
alias pacSi="yay -Si"
alias pacFs="yay -Fs"
alias pacQi="yay -Qi"
alias pacQo="yay -Qo"
alias pacQl="yay -Ql"
alias pacFl="yay -Fl"
alias pacFs="yay -Fs"
alias pacaur="AURDEST=/tmp/pacaur pacaur"

alias makepkg="PKGEXT='.pkg.tar' makepkg"

pacQlb() {
    pacman -Ql $@ | grep /usr/bin/. | sed -e "s:^\(.*\) /usr/bin/\(.*\):\x1b[92m\1\x1b[0m \2:"
}
