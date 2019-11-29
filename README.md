# nebensinn-admin
Scripts for bootstrapping and administration of the nebensinn VPS

## Install
- Create a Python venv:

      python3 -m venv venv
      source venv/bin/activate

- Install Ansible and Python requirements:

      pip install -r requirements.txt

- Install Ansible roles:

      ansible-galaxy install -r roles/requirements.yml

- Run Ansible playbook:

      ansible-playbook site.yml
