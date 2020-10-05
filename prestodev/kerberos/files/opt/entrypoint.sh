#!/bin/bash

set -exuo pipefail

"$@" &

if [[ -v PRESTODEV_POST_BOOTSTRAP_COMMAND ]]; then
    $PRESTODEV_POST_BOOTSTRAP_COMMAND
fi

if test -d /docker/kerberos-init.d; then
    for init_script in /docker/kerberos-init.d/*; do
        "${init_script}"
    done
fi

wait
