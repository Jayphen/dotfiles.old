# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

autoload -U zmv

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="test"

# Example aliases
alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias 'glg'='git lg'
alias 'gut'='git'
alias git='nocorrect git'
alias rspecp='rspec --format documentation'
alias 'git diff'='git diff --color'
alias 'hidedesk'='defaults write com.apple.finder CreateDesktop -bool FALSE;killall Finder'
alias 'showdesk'='defaults delete com.apple.finder CreateDesktop;killall Finder'
alias 'wake'='wakeonlan ec:a8:6b:ff:3a:7c'
alias mmv="noglob zmv -W"
alias recent="ls -lat | head"
alias browserstack="java -jar BrowserStackTunnel.jar 7h88j29wy8mHN8TXVhjT localhost,3000,0"
alias myip="curl ifconfig.me"
alias hg="history | grep"
alias fuck='$(thefuck $(fc -ln -1))'
alias vim='nvim'
alias vi="nvim"

# vimpager
alias ,='vimpager'
export PAGER=/usr/local/bin/vimpager
alias less=$PAGER
alias zless=$PAGER

shop() {
  python /Users/Jayphen/todoist-cli/todoist.py add -p 'Shopping' -c $@
}
todo() {
  python /Users/Jayphen/todoist-cli/todoist.py $@
}

function gh {
  url="http://github.com/"
  thepath=`git config --get remote.origin.url | awk '{print $1}' | sed 's/.*\://' | sed 's/\.git//';`
  thehash=`git rev-parse HEAD`
  echo "$url$thepath/commit/$thehash" | pbcopy
}
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails ruby)
plugins=(git autojump bundler rails ruby brew github brew-cask gem osx history-substring-search zsh-syntax-highlighting)

# PROMPT
source $ZSH/oh-my-zsh.sh
#source ~/.zsh/opp.zsh/opp.zsh
#source ~/.zsh/opp.zsh/opp/*.zsh

export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

# Set editor to nvim
EDITOR='nvim -f'

# Set go path to home dir
export GOPATH=~/.go

# Customize to your needs...
unsetopt correctall
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/MacGPG2/bin:/usr/local/heroku/bin:/usr/local/go/bin:$GOPATH/bin"

### Use Homebrew's directories rather than ~/.rbenv
# export RBENV_ROOT=/usr/local/var/rbenv
# export PATH=RBENV_ROOT

DISABLE_UPDATE_PROMPT=true

eval "$(rbenv init -)"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Enable zsh autocompletion.
function _gulp_completion() {
  # Grab tasks
  compls=$(gulp --tasks-simple)
  completions=(${=compls})
  compadd -- $completions
}

compdef _gulp_completion gulp

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

KEYTIMEOUT=1

ulimit -n 10000

# zsh-bd
. $HOME/.zsh/plugins/bd/bd.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
