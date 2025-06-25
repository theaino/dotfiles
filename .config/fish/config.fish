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


source $(echo '

# Rbenv
rbenv init - | source

# Zoxide
zoxide init --cmd=c fish | source

# Yazi cwd integration
function y; set tmp (mktemp -t "yazi-cwd.XXXXXX"); yazi $argv --cwd-file="$tmp"; if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]; builtin cd -- "$cwd"; end; rm -f -- "$tmp"; end

' | lazysh fish)


###########
# Options #
###########

set -gx EDITOR nvim

alias vim=nvim
alias t=tmuxinator

########
# Path #
########

export GOPATH=$(go env GOPATH)
export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"

