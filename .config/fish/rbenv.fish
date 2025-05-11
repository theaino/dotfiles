set rbenv_commands rbenv gem ruby irb bundle bundler

function __rbenv_init
	command rbenv init - | source
	for cmd in $rbenv_commands
		alias $cmd="command $cmd"
	end
end

for cmd in $rbenv_commands
	eval "
	function $cmd
		__rbenv_init
		$cmd
	end
	"
end
