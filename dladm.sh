#!/bin/sh
# dladm.sh -	Build glue for libdladm:dladm_walk_datalink_id

LIBDLADM=/lib/libdladm.so.1

if [ -f "$LIBDLADM" ]; then
    match=`nm -hgp $LIBDLADM | grep ' T dladm_walk_datalink_id'`
    if [ -n "$match" ]; then
	case $1 in
	'def'* | -[dD] )
	    echo "-DUSE_DLADM" ;;
	'lib'* | -l )
	    echo "-zlazyload -ldladm" ;;
	esac
    fi
fi
