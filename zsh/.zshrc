eval "$(starship init zsh)"

# #################################################################################################
# Configuration
# #################################################################################################

# Common
export LANG=en_US.UTF-8
export TERM=xterm-256color
source $HOME/.aliases

# History
# http://zsh.sourceforge.net/Doc/Release/Options.html#History
#export HISTFILE=~/.zsh_history
#export HISTFILESIZE=1000000000
#export HISTSIZE=1000000000
#export SAVEHIST=1000000000
#setopt EXTENDED_HISTORY
#setopt inc_append_history	# write to the history file immediately, not when the shell exits
#setopt share_history		# share history between all sessions
# setopt noglob

# macos
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export NATIVEFIER_APPS_DIR=~/Applications/

# #################################################################################################
# Setup external binaries
# #################################################################################################
