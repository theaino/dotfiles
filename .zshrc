export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="eastwood"
plugins=(git)

source $ZSH/oh-my-zsh.sh


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
