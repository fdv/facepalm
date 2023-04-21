setopt PROMPT_SUBST

source $ZDOTDIR/git.zsh

# Are we root? If so, let's use a different prompt color
if [ $UID -eq 0 ]; then ROOTPROMPT="%{$fg[red]%}%n%{$reset_color%}::"; fi

function prompt-pwd {

  setopt localoptions extendedglob

  local current_pwd="${PWD/#$HOME/~}"
  print "${${${${(@j:/:M)${(@s:/:)current_pwd}##.#?}:h}%/}//\%/%%}/${${current_pwd:t}//\%/%%}"
  unset current_pwd

}

ZSH_THEME_GIT_PROMPT_PREFIX=" %B%F{white}\uE0A0%f%b "
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{red} ⚒︎%f"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{green} ✔%f "
ZSH_THEME_GIT_PROMPT_ADDED="%F{cyan} ✈%f "
ZSH_THEME_GIT_PROMPT_MODIFIED="%F{yellow} ✭%f "
ZSH_THEME_GIT_PROMPT_DELETED="%F{red} ✗%f "
ZSH_THEME_GIT_PROMPT_RENAMED="%F{blue} ➦%f "
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{magenta} ✂%f "
ZSH_THEME_GIT_PROMPT_UNTRACKED=" ⁇"

# Colors vary depending on time lapsed.
ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="%B%F{white}⌚︎%f%b%F{green}"
ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM="%B%F{white}⌚︎%f%b%F{yellow}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="%B%F{white}⌚︎%f%b%F{red}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%B%F{white}⌚︎%f%b"

# Determine the time since last commit. If branch is clean,
# use a neutral color, otherwise colors will vary according to time.

export PROMPT='$ROOTPROMPT%F{blue}$(prompt-pwd)%f %B%F{red}❯%f%b❯❯ '
export RPROMPT='$(git_time_since_commit)$(git_prompt_info)$(git_prompt_status)%{$reset_color%}'
