source $HOME/.config/zsh/polyglot/polyglot.sh


# Keys
bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word

# Inits
eval "$(rbenv init -)"
eval "$(zoxide init zsh)"


# Misc

function c () {
	eval "z $@"

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

# Opts

export EDITOR=nvim
alias vim=nvim
alias y=yazi

alias t="tmuxinator"


