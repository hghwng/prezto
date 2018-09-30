# Make

alias m="make -j4"
alias mvb="make -j4 VERBOSE=1"
alias mcl="make clean"
alias cmdbg="cmake -DCMAKE_BUILD_TYPE=Debug"
alias cmcmds="cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON"

# Compiler

COMPILER_ARGS="-Wall -Wextra -Wpedantic"
declare -A EXTRA_ARGS
EXTRA_ARGS=('o' '-O3 -march=native' \
            'd' '-O0 -g3'
            '' '')
for EXTRA_ARG in "${(@k)EXTRA_ARGS}"; do
    for COMPILER in "g++" "clang++"; do
        eval "alias ${COMPILER}${EXTRA_ARG}='$COMPILER -std=c++1z $COMPILER_ARGS ${EXTRA_ARGS[$EXTRA_ARG]}'"
    done;
done
unset COMPILER_ARG EXTRA_ARG COMPILER_ARGS EXTRA_ARGS COMPILER

# Debugger

alias d="gdb --args"
alias pd="gdb -ix /usr/share/peda/peda.py"
alias vd="valgrind --vgdb=yes --vgdb-error=0"

# IDA


function ida32() { WINEDEBUG=-all wine ~/.wine/drive_c/Program\ Files/IDA\ 7.0/ida.exe "${@}" & }
function ida64() { WINEDEBUG=-all wine ~/.wine/drive_c/Program\ Files/IDA\ 7.0/ida64.exe "${@}" & }
function ida() {
    local filetype=$(file -b "${@}")
    echo "file type: ${filetype}"
    case "${filetype}" in
        "Mach-O universal"*)
            echo 'Mach-O Universal Binary detected, please open it manually with ida32 or ida64.'
            ;;

        "PE32+"*)
            ;&
        "Mach-O 64-bit"*)
            ;&
        "ELF 64-bit"*)
            echo 'Opening with ida64...'
            ida64 "${@}"
            ;;

        "ELF 32-bit"*)
            ;&
        "PE32"*)
            ;&
        "Mach-O executable"*)
            echo 'Opening with ida32...'
            ida32 "${@}"
            ;;

        *)
            echo 'Unable to detect file type, opening with ida32.'
            ida32 "${@}"
            ;;
    esac
}
