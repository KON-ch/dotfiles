unalias -a

set_bash_prompt() {
  local branch status line staged='' unstaged='' git_prompt

  branch=$(git branch --show-current 2>/dev/null)
  git_prompt=''

  if [ -n "$branch" ]; then
    status=$(git status --porcelain 2>/dev/null)

    while IFS= read -r line; do
      [ -n "$line" ] || continue

      case "$line" in
        '??'*) unstaged=true ;;
        *)
          [ "${line:0:1}" != ' ' ] && staged=true
          [ "${line:1:1}" != ' ' ] && unstaged=true
          ;;
      esac
    done <<< "$status"

    git_prompt=' \[\e[36m\]'
    [ "$staged" = true ] && git_prompt=' \[\e[32m\]!'
    [ "$unstaged" = true ] && git_prompt="${git_prompt}\[\e[31m\]+"
    git_prompt="${git_prompt}${branch} \[\e[0m\]"
  fi

  PS1="\[\e[38;5;242m\]\D{%m-%d %H:%M}\[\e[0m\] \[\e[37m\]\w\[\e[0m\]${git_prompt}\n\\$ "
}

PROMPT_COMMAND=set_bash_prompt

source "$HOME/.shellrc"

if [ -f /opt/homebrew/etc/bash_completion.d/git-completion.bash ]; then
  source /opt/homebrew/etc/bash_completion.d/git-completion.bash
elif [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  source /usr/local/etc/bash_completion.d/git-completion.bash
fi

if declare -F __git_complete >/dev/null; then
  __git_complete go _git_switch
  __git_complete gbdel _git_branch
fi
