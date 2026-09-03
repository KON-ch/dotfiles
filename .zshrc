unalias -a

setopt prompt_subst
setopt auto_cd

autoload -Uz vcs_info
autoload -Uz compinit

if [ -f /opt/homebrew/etc/bash_completion.d/git-completion.bash ]; then
  zstyle ':completion:*:*:git:*' script /opt/homebrew/etc/bash_completion.d/git-completion.bash
elif [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  zstyle ':completion:*:*:git:*' script /usr/local/etc/bash_completion.d/git-completion.bash
fi

compinit

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{green}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u%b %f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'

precmd () { vcs_info }

PROMPT="%F{242}%D{%m-%d %H:%M}%f %F{white}%~%f \$vcs_info_msg_0_
$ "

source "$HOME/.shellrc"

_go() {
  words=(git switch "${words[@]:2}")
  (( CURRENT++ ))
  _git
}

_gbdel() {
  words=(git branch -d "${words[@]:2}")
  (( CURRENT += 2 ))
  _git
}

compdef _go go
compdef _gbdel gbdel
