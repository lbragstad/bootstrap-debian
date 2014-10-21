#!/bin/bash
set -e
if [ $# -ne 2 ]; then
    echo "Usage: ./bootstrap.sh <user> <hostname>"
    exit 1
fi
command -v ansible-playbook >/dev/null 2>&1 || { echo "Switch to a Python virtualenv with ansible installed (pip install ansible)."; exit 1; }
# ssh-copy-id $1@$2

# if we're not root, then we need to sudo everything
if [ $1 == "root" ]; then
    SUDO=''
else
    SUDO='--sudo'
fi

ansible-playbook --user="$1" --inventory-file "$2," $SUDO playbooks/bootstrap.yaml
echo 'Done.'
