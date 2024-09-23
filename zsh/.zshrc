# #################################################################################################
# Powerline
# #################################################################################################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# #################################################################################################
# Plugin manager
# #################################################################################################

export ZIM_HOME=~/.zim
export ZIM_CONFIG_FILE=~/.config/zsh/zimrc
export ZVM_INIT_MODE=sourcing

# Install if not installed
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi

# Automatically install plugins
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi

# Initialize modules
source ${ZIM_HOME}/init.zsh

# #################################################################################################
# Completion
# #################################################################################################

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# #################################################################################################
# Configuration
# #################################################################################################

# Common
export LANG=en_US.UTF-8
export TERM=xterm-256color
source ~/.aliases
test -f ~/.zshrc.ext && source ~/.zshrc.ext

# History
# http://zsh.sourceforge.net/Doc/Release/Options.html#History
export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export SAVEHIST=1000000000
setopt EXTENDED_HISTORY
setopt inc_append_history	# write to the history file immediately, not when the shell exits
setopt share_history		# share history between all sessions

# macos
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export NATIVEFIER_APPS_DIR=~/Applications/

# #################################################################################################
# Setup external binaries
# #################################################################################################

# Add brew bins to PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# User bins
export PATH="{$HOME}/.bin:$PATH"

# asdf package version manager
. $(brew --prefix asdf)/libexec/asdf.sh

# golang
export GOPATH=$(go env GOPATH)
export GOROOT=$(go env GOROOT)
export GOBIN=$(go env GOBIN)
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOBIN

# python
export PATH="$PATH:$HOME/.local/bin"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
