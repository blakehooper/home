alias gw='nocorrect noglob ./gradlew'
alias find='noglob find'
alias ws='cd ~/workspace'

# Delete up to cursor
bindkey \^U backward-kill-line

# Expand camel case and - directories
zstyle ':completion:*' matcher-list 'r:[^A-Z0-9\-]||[A-Z0-9\-]=** r:|=*'

chbr() {
  # possibleBranches=("${(@f)$(git branch | cut -c 3- | grep $1 )}")
  IFS=$'\n'
  # possibleBranches=("${(@f)$(git branch | cut -c 3- | grep $1 )}")
  possibleBranches=($(git branch | cut -c 3- | grep $1 | sed 's/:.*//'))
  unset IFS
  if [ ${#possibleBranches} -ge 2 ]; then
    echo 'More than 1 match'
    for x in $possibleBranches; do echo $x; done
  elif [ ${#possibleBranches} -eq 0 ]; then
    echo '0 branches locally. Searching remote...'
    git fetch
    IFS=$'\n'
    possibleBranches=($(git branch -r | cut -c 3- | grep $1 | sed 's/:.*//'))
    unset IFS
    if [ ${#possibleBranches} -ge 2 ]; then
      echo 'More than 1 match'
      for x in $possibleBranches; do echo $x; done
    else
      echo $possibleBranches[1]
      git co ${possibleBranches[1]#*/}
    fi
  else
    # not 0 index for some reason...
    git co $possibleBranches[1]
  fi  
}
