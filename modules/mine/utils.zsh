takenote() {
    local clip=$(cat)
    local name=$1
    if [[ "x$name" = "x" ]]; then
        local name=$(echo "$clip" | head -n 1 | sed -e 's/[ \t\/\\|&^#]\+/ /g;s/^ *//g;s/ *$//g;')
    fi
    local path="$HOME/doc/notes/$name.txt"
    echo "Saving to $name"
    echo "$clip" >> "$path"
}

alias xcnote='pbp | takenote'

u() {
    while [[ "$#" > 0 ]]; do
        local ext="${1##*.}"
        case "$ext:l" in
            *)
                enconv -L zh_CN -x UTF-8 < "$1" | less
                ;;
            "pdf")
                pdftotext "$1" - | less
                ;;
            "doc")
                echo doc
                ;;
            "docx")
                docx2txt "$1" | less
                ;;
        esac
        shift
    done
}

labprompt() {
    RPROMPT=''
    PROMPT='${ret_status}%  %{$reset_color%}'
}

dotview() {
    dot -Tpdf "$@" -o "${1%.*}.pdf" && evince "${1%.*}.pdf"
}

svg2pdf() {
    inkscape --export-pdf="${1%.*}.pdf" "$@"
}

urldecode() { awk -niord '{printf RT?$0chr("0x"substr(RT,2)):$0}' RS=%.. }

autosync() {
    rsync -av $RSYNC_ARGS "$1" "$2"
    while inotifywait -qr "$1" --exclude '\.#.*' -e modify -e move -e create -e delete; do
        date
        rsync -av $RSYNC_ARGS "$1" "$2"
        sleep 1
    done
}
