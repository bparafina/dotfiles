# Fig pre block. Keep at the top of this file.
. "$HOME/.fig/shell/zshrc.pre.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#zmodload zsh/zprof # Fig pre block. Keep at the top of this file.
# # Path to your oh-my-zsh installation.
if [ "$TMUX" = "" ]; then tmux; fi
export ZSH=/Users/bparafina/.oh-my-zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="sonicradish"
ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="steeef"
# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
#COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/cellar/nmap/:/opt/homebrew/bin/tmux:$HOME/bin:opt/homebrew/bin:$PATH"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=( zsh-256color zsh-completions kubectl aws git command-execution-timer zsh-aliases-exa tmux helm brew docker assume-role history jira last-working-dir sprunge taskwarrior wd git-extras git-flow jsontools command-not-found gem autojump zsh-fzf-history-search zsh-autosuggestions assume-role)
autoload -U compinit && compinit

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# hh-start-search() {
#     TMP=$BUFFER
#     zle push-input
#     BUFFER="hh $TMP"
#     zle accept-line
# }
zle -N hh-start-search
bindkey "\C-r" hh-start-search     # bind hh to Ctrl-r (for Vi mode check doc)

alias hh=hstr
export HSTR_CONFIG=hicolor
export HISTFILESIZE=10000
export HISTSIZE=${HISTFILESIZE}
export HISTCONTROL=ignorespace
setopt histappend
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
# Use rconfiguration

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
# [[ -s "$HOME/.qfc/bin/qfc.sh" ]] && source "$HOME/.qfc/bin/qfc.sh"
# qfc_quick_command 'cd' '\C-b' 'cd $0'
# qfc_quick_command 'vim' '\C-p' 'vim $0'
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# ===== General Purpose Aliases =====
alias grep='grep --color=auto '
alias fgrep='fgrep --color=auto '
alias egrep='egrep --color=auto '
alias srcbp='source ~/.bash_profile; echo ~/.bash_profile refreshed'
# alias vimbrc='vim ~/.bashrc; source ~/.bashrc; echo ~/.bashrc refreshed'
alias edbrc='source ~/.bashrc; echo ~/.bashrc refreshed'
alias tailf='tail -f -n500 '
alias findn='find 2>/dev/null '
# alias cls="osascript -e 'if application \"Terminal\" is frontmost or application \"iTerm\" is frontmost then tell application \"System Events\" to keystroke \"k\" using command down'"
# ===== Path additions. =====

# ===== Tells Apple's Launch Control to use your path =====
export PATH="/opt/local/bin:/opt/local/sbin:$PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin:/opt/bin"
launchctl setenv PATH $PATH

setopt NOCLOBBER
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
export HISTTIMEFORMAT="[%F %T] "
setopt HIST_FIND_NO_DUPS

zstyle -e ':completion::*:hosts' hosts 'reply=($(sed -e "/^#/d" -e "s/ .*\$//" -e "s/,/ /g" /etc/ssh_known_hosts(N) ~/.ssh/known_hosts(N) 2>/dev/null | xargs) $(grep \^Host ~/.ssh/config(N) | cut -f2 -d\  2>/dev/null | xargs))'
autoload -U colors && colors


bindkey "^I" expand-or-complete

# autoload -U up-line-or-beginning-search
# autoload -U down-line-or-beginning-search
# zle -N up-line-or-beginning-search
# zle -N down-line-or-beginning-search
# bindkey "^[[A" up-line-or-beginning-search # Up
# bindkey "^[[B" down-line-or-beginning-search # Down
# bindkey -v
# autoload -U up-line-or-beginning-search
# autoload -U down-line-or-beginning-search
# zle -N up-line-or-beginning-search
# zle -N down-line-or-beginning-search
# bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "\e\e" sudo-command-line                  # [Esc] [Esc] - insert "sudo" at beginning of line
   zle -N sudo-command-line
   sudo-command-line() {
         [[ -z $BUFFER ]] && zle up-history
         if [[ $BUFFER == sudo\ * ]]; then
               LBUFFER="${LBUFFER#sudo }"
         else
               LBUFFER="sudo $LBUFFER"
         fi
   }


# bindkey "^[[B" down-line-or-beginning-search # Down

if (( $+commands[tag] )); then
    export TAG_SEARCH_PROG=ag  # replace with rg for ripgrep
      tag() { command tag "$@"; source ${TAG_ALIAS_FILE:-/tmp/tag_aliases} 2>/dev/null }
        alias ag=tag  # replace with rg for ripgrep
fi

n() { $EDITOR ~/.notes/"$*".txt }
nls() { ls -lah  ~/.notes/ | grep "$*" }

# Fig post block. Keep at the bottom of this file.
# ### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/bparafina/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Fig post block. Keep at the bottom of this file.
. "$HOME/.fig/shell/zshrc.post.zsh"
