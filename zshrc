export ZDOTDIR=${HOME}/.zneuro

agent=$(ssh-agent)
for line in ${agent}; do
  eval $line
done

ssh-add --apple-load-keychain /dev/null 2>&1

clear

export PATH="$HOME/.cargo/bin:$PATH"

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

fpath=(${ZDOTDIR}/zsh-completions/src/ $fpath)
source ${ZDOTDIR}/zsh-autosuggestions/zsh-autosuggestions.zsh
source ${ZDOTDIR}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
