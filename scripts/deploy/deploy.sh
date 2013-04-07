#!/bin/bash

[ -s "$HOME/.rvm/scripts/rvm" ] && . "$HOME/.rvm/scripts/rvm"

log 'Start deployment operations'

log 'Start server deployment operations'
rvm rvmrc load $SERVER_RVMRC
cd $SERVER_DIR
exec_script $SERVER_DEPLOYMENT_SCRIPT 'deployment script of server'
cd $ROOT_DIR
log 'End server deployment operations'

log 'Start app deployment operations'
cd $APP_DIR
exec_script $APP_DEPLOYMENT_SCRIPT 'deployment script of app'
cd $ROOT_DIR
log 'End app deployment operations'

log 'End deployment operations'
