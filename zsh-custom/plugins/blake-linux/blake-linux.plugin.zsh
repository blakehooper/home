# Enable larger history 
export HISTCONTROL=ignoredups
export HISTFILESIZE=3000
export HISTSIZE=1500

alias gw='nocorrect noglob ./gradlew'
alias find='noglob find'
alias ws='cd ~/workspace'

chbr() {
  possibleBranches=("${(@f)$(git branch | cut -c 3- | grep $1 )}")
  if [ ${#possibleBranches} -ge 2 ]; then
    echo 'More than 1 match'
    for x in $possibleBranches; do echo $x; done
  else
    # not 0 index for some reason...
    git co $possibleBranches[1]
  fi  
}
