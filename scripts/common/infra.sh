function log {
  echo "***** $1"
  echo ""
}

function exec_script() {
  local script=$1
  local desc=$2

  if [ -x $script ]
  then
    log "Will run $script which is $desc"
    eval $script
    if [ $? != 0 ]
    then
      log "Failed to run script $script"
      exit -1
    fi
  else
    log "No such script $script found or its not executable"
    exit -1
  fi
}

typeset -fx log
typeset -fx exec_script
