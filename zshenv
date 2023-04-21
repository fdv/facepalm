export EDITOR="mate"
export PATH="/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:${HOME}/bin"

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export GPG_TTY=$(tty)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/share/google-cloud-sdk/path.zsh.inc' ]; then
  . '/usr/local/share/google-cloud-sdk/path.zsh.inc'
fi

export GOPATH=${HOME}

export PATH="/usr/local/opt/mysql-client@5.7/bin:$PATH"

alias ls='exa -l --git'
alias sp="spotify prev"
alias sn="spotify next"
