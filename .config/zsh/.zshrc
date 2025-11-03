[ -f ~/.zshenv ] && source ~/.zshenv

HISTFILE=~/.config/zsh/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

source /usr/share/doc/pkgfile/command-not-found.zsh 2>/dev/null

autoload -Uz compinit
compinit -d ~/.config/zsh/.zcompdump
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'

alias ls='eza --icons'
alias ll='eza -lh --icons'
alias la='eza -lah --icons'
alias lt='eza --tree --level=2 --icons'
alias lta='eza --tree --level=2 --icons -a'
alias tree='eza --tree'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cat='bat'
alias grep='grep --color=auto'
alias df='df -h'
alias free='free -h'
alias du='du -h'
alias mkdir='mkdir -pv'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -Iv'

alias cdi='zi'
alias zz='z -'

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'
alias gd='git diff'

alias preview='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'

alias rg='rg --smart-case --hidden'
alias rgf='rg-fzf'

alias zj='zellij'
alias zja='zellij attach -c'
alias zjl='zellij list-sessions'
alias zjk='zellij delete-session'

setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

setopt EXTENDED_GLOB
setopt NO_CASE_GLOB

bindkey '^[[3~' delete-char
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export LESS='-R'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

export FZF_DEFAULT_OPTS=" \
--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

eval "$(zoxide init zsh)"

mkcd() {
    mkdir -p "$1" && cd "$1"
}

rg-fzf() {
    if [ -z "$1" ]; then
        echo "Usage: rg-fzf <search-term>"
        return 1
    fi
    rg --color=always --line-number --no-heading --smart-case "$1" |
        fzf --ansi \
            --delimiter : \
            --preview 'bat --color=always --style=numbers --highlight-line {2} {1}' \
            --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
            --bind 'enter:become(vim {1} +{2})'
}

extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2) tar xjf "$1" ;;
            *.tar.gz) tar xzf "$1" ;;
            *.bz2) bunzip2 "$1" ;;
            *.gz) gunzip "$1" ;;
            *.tar) tar xf "$1" ;;
            *.zip) unzip "$1" ;;
            *.7z) 7z x "$1" ;;
            *) echo "'$1' cannot be extracted" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*' force-list always

zstyle ':completion:*:*:vim:*' file-patterns '^*.(o|class|pyc):source-files' '*:all-files'

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

eval "$(starship init zsh)"
