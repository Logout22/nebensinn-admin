#!/bin/bash

set -o errexit
set -o nounset

source venv/bin/activate
pip install -r requirements.txt
ansible-galaxy install -r roles/requirements.yml
ansible-playbook -i hosts ${1:-site.yml}
