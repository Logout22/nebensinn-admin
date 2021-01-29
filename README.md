# nebensinn-admin
Scripts for bootstrapping and administration of the nebensinn VPS

## Install
- Create a Python venv:

      python3 -m venv venv
      source venv/bin/activate

- Start the test docker container in `test_container`

      cd test_container
      sudo ./start.sh

- Run Ansible test

      cd ..
      ./run_ansible.sh
