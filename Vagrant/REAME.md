
Basics of using Vagrant playbooks:

# Starting
mkdir playbooks
cd playbooks
vagrant init ubuntu/trusty64
vagrant up

# Destroying
vagrant destroy --force

# To check what ports on the local machine map to SSH port 22 inside each VM
vagrant ssh-config

