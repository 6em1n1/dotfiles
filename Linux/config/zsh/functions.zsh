# ~/.config/zsh/functions.zsh

# Create a directory and immediately enter it
mkcd() {
    if [[ -z "$1" ]]; then
        echo "Usage: mkcd <directory>"
        return 1
    fi
    mkdir -p "$1" && cd "$1"
}

# Go up n directories (default: 1)
up() {
    local steps=${1:-1}
    local path=''
    for i in $(seq 1 $steps); do
        path+='../'
    done
    cd "$path"
}

# Universal archive extractor
extract() {
    if [[ -z "$1" ]]; then
        echo "Usage: extract <archive>"
        return 1
    fi
    if [[ ! -f "$1" ]]; then
        echo "extract: '$1' is not a valid file"
        return 1
    fi
    case "$1" in
        *.tar.bz2)   tar xjf "$1"     ;;
        *.tar.gz)    tar xzf "$1"     ;;
        *.tar.xz)    tar xJf "$1"     ;;
        *.tar.zst)   tar --zstd -xf "$1" ;;
        *.tar)       tar xf "$1"      ;;
        *.bz2)       bunzip2 "$1"     ;;
        *.gz)        gunzip "$1"      ;;
        *.xz)        unxz "$1"        ;;
        *.zip)       unzip "$1"       ;;
        *.7z)        7z x "$1"        ;;
        *.rar)       unrar x "$1"     ;;
        *.Z)         uncompress "$1"  ;;
        *)           echo "extract: '$1' - unknown archive format" ; return 1 ;;
    esac
}

# Find a file by name under the current directory
ff() {
    if [[ -z "$1" ]]; then
        echo "Usage: ff <pattern>"
        return 1
    fi
    find . -name "*$1*" -type f
}

# Reusable yes/no confirmation prompt
confirm() {
    local message=${1:-"Continue?"}
    read -q "?$message [y/N] "
    local ret=$?
    echo
    return $ret
}
