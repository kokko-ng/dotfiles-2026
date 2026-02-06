# Tool Integrations
# Sourced by .zshrc

# ===================
# Oh My Zsh
# ===================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="awesomepanda"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Load Oh My Zsh (if installed)
[[ -f "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"

# ===================
# Ghostty Integration
# ===================
if [[ -n "$GHOSTTY_RESOURCES_DIR" ]]; then
    source "$GHOSTTY_RESOURCES_DIR/shell-integration/zsh/ghostty-integration"
fi

# ===================
# fzf (Fuzzy Finder)
# ===================
if command -v fzf &>/dev/null; then
    # Set up fzf key bindings and fuzzy completion
    source <(fzf --zsh) 2>/dev/null || true

    # Default options
    export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"

    if command -v fd &>/dev/null; then
        export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
        export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
        export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude .git"
    fi
fi

# ===================
# direnv (directory-specific env vars)
# ===================
if command -v direnv &>/dev/null; then
    eval "$(direnv hook zsh)"
fi

# ===================
# mise (runtime version manager)
# ===================
if command -v mise &>/dev/null; then
    eval "$(mise activate zsh)"
fi

# ===================
# zoxide (smarter cd)
# ===================
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init zsh)"
    alias cd="z"
fi
