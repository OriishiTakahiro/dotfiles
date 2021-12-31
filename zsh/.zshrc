autoload -Uz compinit && compinit -i				# for tab supplement
autoload -Uz colors						# use color scheme automatically
autoload -Uz vcs_info         # for use VCS(Version Control System)
compinit setopt auto_pushd		# supplement for cd command (using history)
setopt auto_menu              # show list up candidates of supplement automatically
setopt auto_list              # show list up candidates of supplement by list
setopt list_types             # show kind of supplement
setopt rm_star_silent
setopt prompt_subst           # expand variable reference in $PROMPT
setopt correct								# correct wrong command by zsh
setopt complete_in_word				# spplement word in a word
setopt hist_ignore_all_dups		# dont save same command to history
setopt share_history          # share history between zsh prompts which are activated at same time
setopt inc_append_history
setopt print_eight_bit        # can display Japanese
setopt nolistbeep							# bell wont work
set termguicolors							# use truecolors

### display git info at zsh ###
zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "+"
zstyle ':vcs_info:*' unstagedstr "*"
zstyle ':vcs_info:*' formats '(%b%c%u)'    
zstyle ':vcs_info:*' actionformats '(%b(%a)%c%u)'

neofetch

precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# show branch
function rprompt-git-current-branch {
  local branch_name st branch_status
 
  # current directory is not 
  if [ ! -e  ".git" ]; then
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # all changes are commited
    branch_status="%F{green}"
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    # some changes are not tracked
    branch_status="%F{red}?"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    # some changes are not staged
    branch_status="%F{red}+"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # some changes are not commited
    branch_status="%F{yellow}!"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    # some conflict are existed
    echo "%F{red}!(no branch)"
    return
  else
    branch_status="%F{blue}"
  fi
  # show branch name
  echo "${branch_status}[$branch_name]"
}

# PROMPT="%/%% "
PROMPT="%B%F{111}${HOST}: %~%f%b
%F{040}${USER}%f%B%F{041} %(?,%F{040}>>%f,%F{red}>>%f)%b "	# prompt for leftside
RPROMPT='`rprompt-git-current-branch`'	# prompt for rightside
SPROMPT="%r is correct? [n,y,a,e]: "	# prompt for miss-command

### peco ###
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

### autojump ###
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# setting for keybind
bindkey -v										# for vim keybind


#############################################
#             for some tools                #
#############################################

### pyenv
eval "$(pyenv init -)"

### rbenv
eval "$(rbenv init -)"

### direnv
if [ -x "`which direnv`" ]; then
    eval "$(direnv hook zsh)"
fi

eval "$(scalaenv init -)"
eval "$(sbtenv init -)"
eval "$(jenv init -)"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit

(( ${+_comps} )) && _comps[zinit]=_zinit

### End of Zinit's installer chunk

zplugin ice wait '0'
zplugin light "b4b4r07/enhancd"
