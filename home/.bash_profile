# Filename: .bash_logout
# Description: Sources in on the class MASTER version for settings information
#
# Please (DO NOT) edit this file unless you are sure of what you are doing.
# This file and other dotfiles have been written to work with each other.
# Any change that you are not sure off can break things in an unpredicatable
# ways.

# Set the Class MASTER variable and source the class master version of .cshrc

[[ -z ${MASTER} ]] && export MASTER=${LOGNAME%-*}
[[ -z ${MASTERDIR} ]] && export MASTERDIR=$(eval echo ~${MASTER})

[[ -e ${MASTERDIR}/adm/class.bash_profile ]] && . ${MASTERDIR}/adm/class.bash_profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# run .bashrc on start
if [ -s ~/.bashrc ]; then
    source ~/.bashrc;
fi

# set 256 colors for bash
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
  else
    export TERM='xterm-color'
fi

# set all editors to default to vim
export VISUAL=vim
export EDITOR="$VISUAL"

# vim command opens nvim
alias vim="nvim"

# git-completion setup
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
export PATH="/usr/local/opt/libiconv/bin:$PATH"

# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"

# turn on 256 colors when entering tmux
alias tmux='tmux -2'

# show git branch on prompt line
function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

PS1="\w \$(parse_git_branch)\$ "


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Applications/google-cloud-sdk/path.bash.inc' ]; then . '/Applications/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Applications/google-cloud-sdk/completion.bash.inc' ]; then . '/Applications/google-cloud-sdk/completion.bash.inc'; fi
export PATH="/usr/local/opt/openssl/bin:$PATH"
export CLIENT_ID="676423596371-vtuqpn935s03i16u2uv72p4csqfrv384.apps.googleusercontent.com"
export CLIENT_SECRET="qwiqBPyYurKHpq5YLWZ_9KHq"
alias kfctl="~/Documents/Berkeley/BLISS_research/distributed-cpu-learning/kfctl"
export ZONE="us-west1-b"
export PROJECT="deep-learning-233006"
export KFAPP="dl-kf-app"
