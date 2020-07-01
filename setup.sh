#!/bin/bash

DEBUG_MODE=true
PROJECT_SNIPPETS_FILES=snippets/
VSCODE_MACOS_USER_SNIPPETS_DIR=~/Library/Application\ Support/Code/User/snippets
COMMAND="$1"
blue=$'\e[1;34m'
cyan=$'\e[1;36m'
white=$'\e[0m'
red=$'\e[31m'

export DEBUG=$DEBUG_MODE

log_date() {
  echo $(date '+%Y-%m-%d %H:%M:%S') "$@"
}

log_info() {
  echo "-------------------"
  log_date "INFO..: " $blue "$@" $white
  echo "-------------------"
}

copy_snippets(){

    log_info "Copying snippets to your VSCode user snippets directory..."

    echo "Copying '$PROJECT_SNIPPETS_FILES' to '$VSCODE_MACOS_USER_SNIPPETS_DIR' "

	cp -R "$PROJECT_SNIPPETS_FILES"*.* "$VSCODE_MACOS_USER_SNIPPETS_DIR"

    log_info "Liferay GS snippets successfully copied and ready to use!"
}

install(){
    log_info "Installing Liferay GS VSCode Snippets..."
    log_info "****************************************"

	copy_snippets
}

###########################
# Registering script tasks
###########################
case "${COMMAND}" in
	"install" )
		install
		exit 0
		;; 
	*)

	echo $"Usage: $0 {install}"
	exit 1
esac
exit 0