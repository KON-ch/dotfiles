unalias -a

setopt prompt_subst
setopt auto_cd

autoload -Uz vcs_info

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{green}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u%b %f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'

precmd () { vcs_info }

PROMPT="%F{242}%D{%m-%d %H:%M}%f %F{white}%~%f \$vcs_info_msg_0_
$ "

source "$HOME/.shellrc"
