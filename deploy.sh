#!/bin/bash

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

CURRENT_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $CURRENT_SCRIPT_DIR/scripts/config.sh
. $CURRENT_SCRIPT_DIR/scripts/common/common.sh

function pre_deploy {
	exec_script $PRE_DEPLOYMENT_SCRIPT 'pre-deployment operations'
}

function post_deploy {
	exec_script $POST_DEPLOYMENT_SCRIPT 'post-deployment operations'
}

function deploy {
	exec_script $DEPLOYMENT_SCRIPT 'deployment operations'
}

function clean_known_host {
	log 'clean ~/.ssh/known_hosts'
	cat /dev/null > ~/.ssh/known_hosts
}

function main {
	clean_known_host
	log 'Start deployment'

	pre_deploy  && \
	deploy      && \
	post_deploy &&

	log 'Deployment is done'
}

main
