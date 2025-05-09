source $HOME/.config/zsh/polyglot/polyglot.sh


# Misc

eval "$(zoxide init zsh)"

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

export EDITOR=nvim
alias vim=nvim
alias y=yazi


if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi
