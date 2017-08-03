##Install instructions

install zsh

`brew install zsh`

install oh-my-zsh

`curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh`

Checkout new plugins into local directory
ToDo: move to ume repository

`git clone https://github.com/blakehooper/home.git`

Edit `~/.zshrc`
* Add `ZSH_CUSTOM=<Full path to clone>/home/zsh-custom`
* Edit plugins `plugins=(git osx cp gradle underwriteme)`

##Functions

###chbr
Usage: `chbr <search string ex. jira reference>`

Result: Branch changed if pattern results in unique branch. Possible branches listed if not.

Doesn't currently search remote branches