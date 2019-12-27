alias pacDd="sudo pacman -D --asdeps"
alias pacFl="sudo pacman -Fl"
alias pacF="pacman -F"
alias pacQi="pacman -Qi"
alias pacQl="pacman -Ql"
alias pacQo="pacman -Qo"
alias pacRs="sudo pacman -Rs"
alias pacSc="sudo pacman -Sc"
alias pacSd="sudo pacman -S --asdeps"
alias pacSi="sudo pacman -Si"
alias pacSs="sudo pacman -Ss"
alias pacS="sudo pacman -S"

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
