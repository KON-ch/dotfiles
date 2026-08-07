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

export PATH=/usr/bin/git:$PATH

alias ls="ls -GF"
alias ll="ls -lAGF"
alias la="ls -AGF"
alias cp="cp -i"
alias mv="mv -i"

go(){
  local branch
  branch=$(
    git branch --format="%(refname:short)" |
    fzf --preview "git log --oneline --graph --decorate -20 {}"
  ) || return
  git switch "$branch"
}
gbdel(){
  local branch
  branch=$(
    git branch --format="%(refname:short)" |
      grep -vx "$(git branch --show-current)" |
      fzf
  ) || return
  git branch -d "$branch"
}
gspop() {
  local stash
  stash=$(
    git stash list |
    fzf --preview 'git stash show -p {1}' |
    cut -d: -f1
  ) || return
  git stash pop "$stash"
}
gshow() {
  local commit
  commit=$(
    git log --oneline |
    fzf --preview 'git show --color=always {1}' |
    awk '{print $1}'
  ) || return
  git show "$commit"
}
gsdrop() {
  local stash
  stash=$(
    git stash list |
    fzf --preview 'git stash show -p {1}' |
    cut -d: -f1
  ) || return
  git stash drop "$stash"
}

alias gom="git switch main"
alias gback="git switch -"
alias gl="git log --graph --decorate --pretty=format:'%C(auto)%h%d %C(reset)%ad (%an) %s' --date=short"
alias gl1="gl -10"

alias gsw="git switch"
alias gpl="git pull"
alias gp="git push"
alias gs="git status -sb"
alias gd="git diff"
alias gds="git diff --stat"
alias gdc="git diff --cached"
alias ga="git add"
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gcan="git commit --amend --no-edit"
alias gb="git branch -v"
alias gf="git fetch"
alias gfp="git fetch --prune"
alias gm="git merge"
alias gr="git restore"
alias grs="git restore --staged"
alias gsu="git stash push -u"
alias gsl="git stash list"
alias grh="git reset --hard"
alias gcp="git cherry-pick"

alias dc="docker compose"
alias dcd="docker compose -f docker-compose.dev.yml"
alias da="docker attach"
alias dcp="docker compose ps"
alias dcs="docker compose stop"
