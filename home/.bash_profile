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

# set all editors to default to vim
export VISUAL=vim
export EDITOR="$VISUAL"

# added by Anaconda3 4.2.0 installer
export PATH="/Users/jhong/anaconda3/bin:$PATH"

# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

#git-completion setup
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
export PATH="/usr/local/opt/libiconv/bin:$PATH"

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
