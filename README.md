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

      ansible-playbook -e aws_access_key=$AWS_ACCESS_KEY_ID -e aws_secret_key=$AWS_SECRET_ACCESS_KEY site.yml
