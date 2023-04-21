export ZDOTDIR=${HOME}/.zneuro

agent=$(ssh-agent)
for line in ${agent}; do
  eval $line
done

ssh-add --apple-load-keychain /dev/null 2>&1

clear

if [ -f $ZDOTDIR/zsecrets.gpg ]; then
  local secrets=$(gpg --decrypt $ZDOTDIR/zsecrets.gpg 2> /dev/null)

  for line in $secrets; do
    if [[ "$line" =~ ^export.* ]]; then
      eval $line
    fi
  done

  unset secrets
fi

source $ZDOTDIR/prompt.zsh

plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
)

for plugin in $plugins; do
  if [ -d "${ZDOTDIR}/${plugin}" ]; then
    source "${ZDOTDIR}/${plugin}/${plugin}.plugin.zsh"
  else
    print -P "%F{red}Plugin ${plugin} not found%f\n"
  fi
done
