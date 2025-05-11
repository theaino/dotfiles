if status is-login
	if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]
		exec startx
	end
end


fish_vi_key_bindings
set -U fish_greeting


################
# Lazy loading #
################

# Zoxide
function c
	zoxide init --cmd=c fish | source
	c $argv
end

# Rbenv
source ~/.config/fish/rbenv.fish


###########
# Options #
###########

set -gx EDITOR nvim

alias vim=nvim
alias y=yazi
alias t=tmuxinator
