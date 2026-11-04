eval "$(starship init zsh)"

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

source "$HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
export PATH="$HOME/.config/emacs/bin:$PATH"

bindkey '\e[1;3C' emacs-forward-word
bindkey '\e[1;3D' emacs-backward-word

