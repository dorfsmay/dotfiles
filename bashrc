export HISTCONTROL=ignorespace
set -o vi
#export PS1='\u@\h$ '
export VISUAL=vim
export EDITOR=vim
alias ls='ls --color'
alias e='emacs -nw'


export GPGKEY=32B0F416

#export PATH=/export/home/yves/.cabal/bin:$PATH
#export PATH="/usr/local/heroku/bin:$PATH"

# go
#export PATH="/usr/lib/go-1.11/bin:$PATH"
# Rust
export PATH="~/.cargo/bin:$PATH"
export PATH=$PATH:/snap/bin



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

