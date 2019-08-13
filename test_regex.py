""" Test vehicle for Python regular expressions as used in Ansible """

import re

with(open('50unattended-upgrades', 'r')) as datei:
    print(len([match for match in
               [
                   re.match(
                       re.compile('^(//)?Unattended-Upgrade::Automatic-Reboot-Time "02:00";'), line)
                   for line in datei.readlines() if line is not None
               ] if match is not None
              ]))
