unalias -a

setopt prompt_subst

autoload -Uz vcs_info

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{green}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{yellow}%c%u%b %f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'

precmd () { vcs_info }

PROMPT="
%F{green}%D{%Y-%m-%d %H:%m:%S} <%m> %~%f
%F{magenta}%c%f %F{cyan}%n%f \$vcs_info_msg_0_
$ "

alias ls="ls -GF"
alias ll="ls -laGF"

go(){git branch --all --format="%(refname:short)" | fzf | xargs git checkout}
gbdel(){git branch --format="%(refname:short)" | fzf | xargs git branch -d}

alias gom="git checkout main"
alias gl="git log --graph --pretty=format:'%h %ad (%an) %s' --date=short"

alias gp="git pull"
alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias ga="git add"
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gb="git branch -v"
alias gf="git fetch"
alias gm="git merge"
alias gr="git restore"
alias gsu="git stash -u"
alias gsp="git stash pop"
alias gsl="git stash list"

alias dc="docker compose"
alias dcd="docker compose -f docker-compose.dev.yml"
alias da="docker attach"
alias dcp="docker compose ps"
alias dcs="docker compose stop"
