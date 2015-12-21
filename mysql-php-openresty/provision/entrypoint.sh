#!/bin/bash

set -x
set -e

OWNER_UID="$(stat -c %u /srv)"
OWNER_GID="$(stat -c %g /srv)"
if [ ${OWNER_UID} != 1000 ]; then
    usermod -o --uid ${OWNER_UID} www-data
    groupmod -o --gid ${OWNER_GID} www-data
fi

/usr/bin/supervisord

