# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

eval "$(rbenv init -)"

eval "$(zoxide init zsh)"

CHANGEDIR=cd

for CCD in z; do
	if [ ! -z $(command -v $CCD) ]; then
		CHANGEDIR=$CCD
	fi
done

function c () {
	eval "$CHANGEDIR $@"

	if [[ -z "$VIRTUAL_ENV" ]]; then
		for venvname in virtualenv .virtualenv venv .venv env .env; do
			if [[ -d "./$venvname" ]]; then
				source "./$venvname/bin/activate"
				break
			fi
		done
	else
		parentdir="$(dirname "$VIRTUAL_ENV")"
		if [[ "$PWD"/ != "$parentdir"/* ]]; then
			deactivate
		fi
	fi
}

c .

export PATH="$PATH:$HOME/.config/scripts"


export EDITOR=nvim


alias vim=nvim
# alias v=nvim

alias rgr=ranger
alias r=ranger

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

m () { udevil mount "/dev/$1" }
um () { udevil unmount "/dev/$1" }

alias cl='csvlens -dauto'

# fnm
# FNM_PATH="/home/aino/.local/share/fnm"
# if [ -d "$FNM_PATH" ]; then
#   export PATH="/home/aino/.local/share/fnm:$PATH"
#   eval "`fnm env`"
# fi
eval $(fnm env)

# opam configuration
[[ ! -r /home/aino/.opam/opam-init/init.zsh ]] || source /home/aino/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

export PATH=$HOME/bin/tinygo/bin:$PATH

export PATH=$HOME/.local/bin:$PATH
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin

#alias gvim="nvim --listen ~/.cache/nvim/godot.pipe ."

export VCPKG_ROOT="/home/aino/bin/vcpkg/"
export PATH="$PATH:$VCPKG_ROOT"

export PATH="$PATH:/home/aino/bin/gf/"
export PATH="$PATH:/home/aino/bin/glsldb/bin"


if [[ $(cat /proc/sys/net/ipv6/conf/all/disable_ipv6) == 1 ]] ; then
	echo "IPv6 is disabled (/etc/sysctl.conf)"
fi

PATH="/home/aino/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/aino/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/aino/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/aino/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/aino/perl5"; export PERL_MM_OPT;


# Import colorscheme from 'wal' asynchronously
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

export WASMTIME_HOME="$HOME/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"

[[ -s "/home/aino/.gvm/scripts/gvm" ]] && source "/home/aino/.gvm/scripts/gvm"


export PATH="$PATH:$HOME/.cargo/bin"


function esp () {
	source /opt/esp-idf/export.sh
}


[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"


cat ~/.cache/wal/sequences

alias y="TERM=xterm-kitty y"


alias aic="~/Documents/dev/aicli/main.py"
