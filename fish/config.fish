set -g -x PATH /usr/local/bin $PATH

function fish_greeting
  fortune -a | cowsay
end

function fuck -d 'Correct your previous console command'
    set -l exit_code $status
    set -l eval_script (mktemp 2>/dev/null ; or mktemp -t 'thefuck')
    set -l fucked_up_commandd $history[1]
    thefuck $fucked_up_commandd > $eval_script
    . $eval_script
    rm $eval_script
    if test $exit_code -ne 0
        history --delete $fucked_up_commandd
    end
end

# Autojump init
[ -f /usr/local/share/autojump/autojump.fish ]; and . /usr/local/share/autojump/autojump.fish

# Some basic functions
function gst
  git status
end
function gl
  git log
end
function recent
  ls -lat | head
end

# Load Fuzzy Finder
fzf_key_bindings

# Handy aliases {{{

alias vim="nvim"

# Mac OS X helper utilities
alias hide-desktop 'defaults write com.apple.finder CreateDesktop false; killall Finder'
alias show-desktop 'defaults write com.apple.finder CreateDesktop true; killall Finder'

# }}}