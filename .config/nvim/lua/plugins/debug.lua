return {
	{
		"puremourning/vimspector",
		keys = {
			{"<Leader>dd", ":call vimspector#Launch()<CR>"},
			{"<Leader>de", ":call vimspector#Reset()<CR>"},
			{"<Leader>dc", ":call vimspector#Continue()<CR>"},

			{"<Leader>dt", ":call vimspector#ToggleBreakpoint()<CR>"},
			{"<Leader>dT", ":call vimspector#ClearBreakpoints()<CR>"},

			{"<Leader>dk", "<Plug>VimspectorRestart"},
			{"<Leader>dh", "<Plug>VimspectorStepOut"},
			{"<Leader>dl", "<Plug>VimspectorStepInto"},
			{"<Leader>dj", "<Plug>VimspectorStepOver"}
		}
	}
}

