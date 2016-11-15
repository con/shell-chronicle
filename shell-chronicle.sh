export CURBASHSTART=`grep -v "^[ \t]*$" $HISTFILE | wc -l | awk '{print $1}'`  CURBASHDATE=`date`
shopt -s cmdhist histappend

archive_history()
{
    HISTORYOLD=${HISTFILE}.archive
    CURTIME=`date`
    CURTTY=`tty`
    if  [ x$HISTDUMPPED = x ]; then
      echo "#-${HOSTNAME}-- ${CURBASHDATE} - ${CURTIME} ($CURTTY) ----" >>   $HISTORYOLD
      history $(($HISTCMD-${CURBASHSTART-0})) | sed -e 's/^[ ]*[0-9][0-9]* [ ]*//g'  >> $HISTORYOLD
      export HISTDUMPPED=1
    fi
}

exit ()
{
   archive_history
   builtin exit
}

trap "archive_history" EXIT
