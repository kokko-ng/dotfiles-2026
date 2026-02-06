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

# ===================
# Git Helpers
# ===================

# Create a new branch and push it to origin
gnew() {
    git checkout -b "$1" && git push -u origin "$1"
}

# Delete local branches that have been merged
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
