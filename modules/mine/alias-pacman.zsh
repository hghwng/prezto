alias pacSyu="yay -Syu"
alias pacSd="yay -S --asdeps"
alias pacS="yay -S"
alias pacDd="yay -D --asdeps"
alias pacRs="yay -Rs"
alias pacSc="yay -Sc"
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

pacKv() {
    local running=$(uname -r | sed -e 's/-[A-Z]*$//;s/-/./g')
    local package=$(ls /var/lib/pacman/local/ | grep -E '^linux-[0-9].*' | sed -e 's/linux-//;s/-/./g')
    if [[ "$running" == "$package" ]]; then
        echo "Up to date";
    else
        echo "Reboot needed";
    fi;
    echo "Running: $running"
    echo "Package: $package"
}
