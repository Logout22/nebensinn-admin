# nebensinn-admin
Scripts for bootstrapping and administration of the nebensinn VPS

## Install
- Create a Python venv:

      python3 -m venv venv
      source venv/bin/activate

- Create a local inventory file:

      [site]
      domain.com ansible_host=domain.com ansible_port=1234 ansible_user=root ansible_python_interpreter=/usr/bin/python3

- Run Ansible

      ./run_ansible.sh
