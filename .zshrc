# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
# Add Rust to the PATH
export PATH="$HOME/.cargo/bin:$PATH"
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="eastwood"

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode zsh-vimode-visual ssh-agent zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR=vim
export VISUAL=vim

# Copy pasting commands from Chatgpt is a real job
alias nano='vim'
function sudo {
  if [[ $1 == nano ]]; then
    shift
    command sudo vim "$@"
  else
    command sudo "$@"
  fi
}

# Tmux config
export TMUX_PLUGIN_MANAGER_PATH="$HOME/.tmux/plugins"
alias tmux='tmux -u'

# Man in vim
export MANPAGER="col -bx | vim -R -"

# Cd to home because else wsl starts in windows fs
cd ~

# Automatically start tmux if not already in a tmux session
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux
fi

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
