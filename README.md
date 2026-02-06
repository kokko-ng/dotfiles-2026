# Dotfiles

Personal configuration files for zsh, Ghostty, and Claude Code.

## Contents

```
.
├── .zshrc              # Main zsh config (sources modular files)
├── .zprofile           # Login shell config (Homebrew)
├── zsh/
│   ├── aliases.zsh     # Shell aliases
│   ├── functions.zsh   # Helper functions
│   └── integrations.zsh # Tool integrations (oh-my-zsh, fzf, etc.)
├── ghostty/
│   └── config          # Ghostty terminal configuration
└── claude/
    └── CLAUDE.md       # Global Claude Code instructions
```

## Installation

```bash
# Clone the repo
git clone https://github.com/kokko-ng/dotfiles-2026.git ~/.dotfiles

# Symlink configs
ln -sf ~/.dotfiles/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/.zprofile ~/.zprofile
ln -sf ~/.dotfiles/zsh ~/.config/zsh
ln -sf ~/.dotfiles/ghostty/config ~/.config/ghostty/config
ln -sf ~/.dotfiles/claude/CLAUDE.md ~/.claude/CLAUDE.md
```

## Dependencies

- [Ghostty](https://ghostty.org/) - terminal emulator
- [oh-my-zsh](https://ohmyz.sh/)
- [eza](https://github.com/eza-community/eza) - modern ls
- [ripgrep](https://github.com/BurntSushi/ripgrep) - modern grep
- [bat](https://github.com/sharkdp/bat) - modern cat
- [fd](https://github.com/sharkdp/fd) - modern find
- [delta](https://github.com/dandavison/delta) - modern diff
- [fzf](https://github.com/junegunn/fzf) - fuzzy finder
- [zoxide](https://github.com/ajeetdsouza/zoxide) - smarter cd
- [direnv](https://direnv.net/) - directory-specific env vars
- [mise](https://mise.jdx.dev/) - runtime version manager
