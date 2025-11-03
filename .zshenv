export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_STATE_HOME/zsh/history"

export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export GOPATH="$XDG_DATA_HOME/go"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"

export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="alacritty"
export BROWSER="librewolf"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$CARGO_HOME/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$XDG_DATA_HOME/npm/bin:$PATH"

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export PAGER="less"
export LESS="-R"
export MANPAGER="less -R"
