export GREP_COLORS='ms=01;31'

export LS_COLORS="di=38;5;141"

# function lc [] | returns the 0-255 color scale
function lc() {
    for i in {0..255} ; do
        printf "\x1b[48;5;%sm%3d\e[0m " "$i" "$i"
        if (( i == 15 )) || (( i > 15 )) && (( (i-15) % 6 == 0 )); then
            printf "\n";
        fi
    done
}