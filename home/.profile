#   -----------------------------
#   1. Old bash profile
#   -----------------------------

export PATH="/usr/local/opt/python/libexec/bin:$PATH"

export PATH="$HOME/.poetry/bin:$PATH"
[ -z "$ZSH_NAME" ] && [ -f ~/.fzf.bash ] && source ~/.fzf.bash

export HOMESHICK_DIR=/opt/homebrew/opt/homeshick
source "/opt/homebrew/opt/homeshick/homeshick.sh"

# set 256 colors for bash
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
    export TERM="xterm-256color"
  else
    export TERM="xterm-color"
fi

# set all editors to default to vim
export VISUAL=nvim
export EDITOR="$VISUAL"

# vim command opens nvim
alias vim="nvim"

# r command opens radian
alias r="radian"

# git-completion setup
if [ -f ~/.git-completion.zsh ]; then
  . ~/.git-completion.zsh
fi
export PATH="/usr/local/opt/libiconv/bin:$PATH"

# turn on 256 colors when entering tmux
alias tmux="tmux -2"

# relax multithreading fork safety from High Sierra
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

#   -----------------------------
#   2.  MAKE TERMINAL BETTER (from https://gist.github.com/stephenll/8762279)
#   -----------------------------

alias ls='ls -Gp'			    # Preferred ‘ls’ implementation
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
# alias less='less -FSRXc'                    # Preferred 'less' implementation
# cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .2='cd ../../'                        # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
# alias edit='subl'                           # edit:         Opens any file in sublime editor
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
# alias which='type -all'                     # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop
alias jnb='jupyter notebook'
alias gs='git status'
alias gco='git checkout'
alias ga='git add'
alias gp='git push'
alias gc='git commit'
alias gd='git diff'

# Conda aliases
alias condde='conda deactivate'
alias condac='conda activate'
alias condli='conda list'

#   lr:  Full Recursive Directory Listing
#   ------------------------------------------
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

#   mans:   Search manpage given in agument '1' for term given in argument '2' (case insensitive)
#           displays paginated result with colored search terms and two lines surrounding each hit.             Example: mans mplayer codec
#   --------------------------------------------------------------------
    mans () {
        man $1 | grep -iC2 --color=always $2 | less
    }

#   showa: to remind yourself of an alias (given some part of it)
#   ------------------------------------------------------------
    showa () { /usr/bin/grep --color=always -i -a1 $@ ~/Library/init/bash/aliases.bash | grep -v '^\s*$' | less -FSRXc ; }

