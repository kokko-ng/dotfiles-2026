# shellcheck shell=bash
# Zsh Functions
# Sourced by .zshrc

# ===================
# PATH Helpers
# ===================

# Prepend directory to PATH (if it exists and isn't already in PATH)
path_prepend() {
    [[ -d "$1" ]] && [[ ":$PATH:" != *":$1:"* ]] && PATH="$1:$PATH"
}

# Append directory to PATH (if it exists and isn't already in PATH)
path_append() {
    [[ -d "$1" ]] && [[ ":$PATH:" != *":$1:"* ]] && PATH="$PATH:$1"
}

# ===================
# Directory Navigation
# ===================

# Create directory and cd into it
mkcd() {
    mkdir -p "$1" && cd "$1" || return
}

# Find directory and cd into it
fcd() {
    local dir
    dir=$(find "${1:-.}" -type d 2>/dev/null | fzf +m) && cd "$dir" || return
}

# ===================
# File Operations
# ===================

# Extract various archive formats
extract() {
    if [[ -f "$1" ]]; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"     ;;
            *.tar.gz)    tar xzf "$1"     ;;
            *.tar.xz)    tar xJf "$1"     ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar x "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xf "$1"      ;;
            *.tbz2)      tar xjf "$1"     ;;
            *.tgz)       tar xzf "$1"     ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# ===================
# Git Helpers
# ===================

# Note: gcam is provided by oh-my-zsh git plugin (git commit --all --message)

# Create a new branch and push it to origin
gnew() {
    git checkout -b "$1" && git push -u origin "$1"
}

# Delete local branches that have been merged
# Note: gclean is taken by oh-my-zsh (git clean --interactive -d)
gbclean() {
    git branch --merged | grep -v '\*\|main\|master' | xargs -n 1 git branch -d
}

# ===================
# Development
# ===================

# Quick HTTP server
serve() {
    local port="${1:-8000}"
    python3 -m http.server "$port"
}

# Find process by name
psgrep() {
    ps aux | grep -v grep | grep -i "$1"
}

# Kill process by port
killport() {
    lsof -ti :"$1" | xargs kill -9
}

# ===================
# Docker Helpers
# ===================

# Stop all running containers
dstop() {
    docker stop "$(docker ps -q)" 2>/dev/null
}

# Remove all stopped containers
dclean() {
    docker container prune -f
}

# Remove all unused images
diclean() {
    docker image prune -a -f
}

# ===================
# Utilities
# ===================

# Weather in terminal
weather() {
    curl -s "wttr.in/${1:-}"
}

# Quick notes
note() {
    local notes_dir="$HOME/notes"
    mkdir -p "$notes_dir"
    if [[ -z "$1" ]]; then
        ls -la "$notes_dir"
    else
        $EDITOR "$notes_dir/$1.md"
    fi
}

# JSON pretty print
json() {
    if [[ -p /dev/stdin ]]; then
        cat | python3 -m json.tool
    else
        python3 -m json.tool "$1"
    fi
}
