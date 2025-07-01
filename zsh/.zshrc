# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Plugins for Oh My Zsh
plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Custom Aliases
source ~/.zsh_profile

# Path to your custom scripts
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/usr/local/bin"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# NVIM
export PATH="$PATH:/opt/nvim-linux64/bin"

# Zoxide
eval "$(zoxide init zsh)"

# Starship
eval "$(starship init zsh)"
# Custom config
# export STARSHIP_CONFIG=~/.cache/wal/starship.toml

# ---- Yazi Setup ----
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# ---- Composer ----
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

# # NNN
# export NNN_PLUG="p:preview-tui"
# export NNN_FIFO="/tmp/nnn.fifo"
#
# export PAGER="less -R"
#
# # NNN fast explore
# source $HOME/.local/zsh/quitcd.zsh
#
# # n^M == Return
# bindkey -s '^E' 'n^M'
#
# # One Dark Theme
# BLK="04" CHR="04" DIR="04" EXE="00" REG="00" HARDLINK="00" SYMLINK="06" MISSING="00" ORPHAN="01" FIFO="0F" SOCK="0F" OTHER="02"
# export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
