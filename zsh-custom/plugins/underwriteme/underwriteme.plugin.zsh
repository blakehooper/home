# Enable larger history 
export HISTCONTROL=ignoredups
export HISTFILESIZE=3000
export HISTSIZE=1500

export MYSQL_HOME=/usr/local/mysql
export PATH="$PATH:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin:$MYSQL_HOME/bin:./node_modules/.bin"

export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)

alias gw='nocorrect noglob ./gradlew'
alias grails='noglob grails'
alias find='noglob find'
alias grails-debug='noglob grails-debug'

# Project shortcuts
alias shed='cd ~/workspace/the-shed'
alias shed2='cd ~/workspace/the-shed2'
alias sld-web='cd ~/workspace/sld-web'
alias comparison-web='cd ~/workspace/comparison-web'
alias aegon-web='cd ~/workspace/aegon-web'
alias lv-web='cd ~/workspace/lv-web'

# Enable command line navigation alt+-> alt+<-
bindkey "\e\e[D" backward-word
bindkey "\e\e[C" forward-word

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
