vim () {
    if [[ -d "venv" ]]; then
	IS_VENV=1
    fi
    if [[ -z "$@" ]]; then
	SESSION_FILE="Session.vim"
	GIT_BRANCH=""
	if [[ -d ".git" ]]; then
	    GIT_BRANCH=$(git branch --show-current)
	    SESSION_FILE="Session-${GIT_BRANCH}.vim"
	fi
	if [[ -f "$SESSION_FILE" ]]; then
	    if [[ -n "$IS_VENV" ]]; then
		. venv/bin/activate
	    fi
	    nvim -S "$SESSION_FILE" -c "lua vim.g.savesession = true ; vim.g.sessionfile = \"${SESSION_FILE}\""
	else
	    nvim -c "lua vim.g.savesession = true ; vim.g.sessionfile = \"${SESSION_FILE}\""
	fi
    else
    	nvim "$@"
    fi
}
