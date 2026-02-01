# ===================
# Zsh Configuration
# ===================
# Modular configuration - sources separate files for organization
# Order matters: integrations -> functions -> aliases -> local

# Determine the dotfiles zsh directory
# Priority: 1) Same dir as this script, 2) Symlink target dir, 3) ~/.config/zsh
DOTFILES_ZSH="${0:A:h}"
if [[ -L ~/.zshrc ]]; then
    DOTFILES_ZSH="$(dirname "$(readlink ~/.zshrc)")"
fi
# Fallback to ~/.config/zsh if modular files aren't found
if [[ ! -f "$DOTFILES_ZSH/integrations.zsh" ]] && [[ -f "$HOME/.config/zsh/integrations.zsh" ]]; then
    DOTFILES_ZSH="$HOME/.config/zsh"
fi

# ===================
# Source Modular Configs
# ===================

# Tool integrations (oh-my-zsh, fzf, etc.)
[[ -f "$DOTFILES_ZSH/integrations.zsh" ]] && source "$DOTFILES_ZSH/integrations.zsh"

# Helper functions
[[ -f "$DOTFILES_ZSH/functions.zsh" ]] && source "$DOTFILES_ZSH/functions.zsh"

# Aliases
[[ -f "$DOTFILES_ZSH/aliases.zsh" ]] && source "$DOTFILES_ZSH/aliases.zsh"

# ===================
# Local Overrides
# ===================
# Machine-specific settings (not tracked in git)
# Create ~/.zshrc.local for custom settings
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
