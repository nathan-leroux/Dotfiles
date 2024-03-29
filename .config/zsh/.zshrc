# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source "$CONFIG/terminal/init"

# Oh My Zsh Settings
export ZSH="$CONFIG/oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"


plugins=(
    git
    zsh-autosuggestions
    autoswitch_virtualenv
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# zsh settings
unsetopt AUTO_CD

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
