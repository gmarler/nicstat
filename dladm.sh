#!/bin/sh
# dladm.sh -	Build glue for libdladm:dladm_walk_datalink_id

LIBDLADM=/lib/libdladm.so.1

if [ -f "$LIBDLADM" ]; then
    # Make sure we don't pick up /usr/gnu/bin/nm on Solaris 11 by mistake
    match=`/bin/nm -hgp $LIBDLADM | grep ' T dladm_walk_datalink_id'`
    if [ -n "$match" ]; then
	case $1 in
	'def'* | -[dD] )
	    echo "-DUSE_DLADM" ;;
	'lib'* | -l )
	    echo "-zlazyload -ldladm" ;;
	esac
    fi
fi
