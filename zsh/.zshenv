export LANG="ja_JP.UTF-8"

export EDITOR=vim

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

### for Neovim ###
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"

### aliases ###
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias ls="exa"
alias la="exa -a"
alias ll="exa -l --git --icons"
alias tree="exa -T"
alias diff="colordiff -u"
alias gr="log --decorate=short --graph --name-status --oneline --all --tags"
alias grep="grep --color=auto"
alias vim="nvim"
alias tf="terraform"
alias cci="circleci"
alias diff='colordiff -u'

alias d="docker"
alias dc="docker-compose"
alias k="kubectl"
alias i="istioctl"

alias g="git"
alias gd='cd $(ghq root)/$(ghq list | peco)'
# alias go='git remote -v | awk '/origin.*push/ {print $2}' | xargs open'
alias sed='gsed'

### aliases for krew commands
alias kc="kubectl ctx | peco | xargs kubectl ctx"
alias kn="kubectl ns | peco | xargs kubectl ns"

### for avoid Mojibake in less ###
export LESSCHARSET=utf-8

### docker ###
fpath=($fpath ~/.zsh/completion(N-/))

### nodebrew ###
path=($path ~/.nodebrew/current/bin(N-/))

### golang ###
export GOPATH=$HOME/go
export GO111MODULE=on
path=($path $GOPATH/bin(N-/))

### pyenv ###
export PYENV_ROOT="$HOME/.pyenv"
path=($path $HOME/.pyenv(N-/))

### rbenv ###
path=($path $HOME/.rbenv/bin(N-/))

### scalaenv ###
path=($path $HOME/.scalaenv/bin(N-/))

### sbtenv ###
path=($path $HOME/.sbtenv/bin(N-/))

### jenv ###
path=($path $HOME/.jenv/bin(N-/))

### cabal ###
path=($path $HOME/.cabal/bin(N-/))

### pip ###
path=($path $HOME/Library/Python/3.8/bin(N-/))

### krew ###
path=($path ${KREW_ROOT:-$HOME/.krew}/bin(N-/))
