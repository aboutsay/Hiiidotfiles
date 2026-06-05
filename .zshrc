
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(starship init zsh)"

bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search


alias ls='ls --color=auto'
alias ll='ls -alF'
alias grep='grep --color=auto'


HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
export PATH=$PATH:$HOME/.spicetify
