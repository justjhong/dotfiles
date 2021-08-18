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
export VISUAL=nvim
export EDITOR="$VISUAL"

# vim command opens nvim
alias vim="nvim"

# r command opens radian
alias r="radian"

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

# Add TeXbin to PATH
export PATH="/Library/TeX/texbin:${PATH}"

# turn on 256 colors when entering tmux
alias tmux='tmux -2'

# show git branch on prompt line
function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

PS1="\w \$(parse_git_branch)\$ "

# ruby in path and set up rbenv automatically
export PATH="/usr/local/opt/ruby/bin:$PATH"
eval "$(rbenv init -)"

# relax multithreading fork safety from High Sierra
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# python3 cli in path
export PATH="/Users/jjhong/Library/Python/3.7/bin:$PATH"

# pyenv-virtualenv automatic activation
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


export PATH="$HOME/.poetry/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/jjhong/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/jjhong/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/jjhong/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/jjhong/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
