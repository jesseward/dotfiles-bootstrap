dotfiles-bootstrap
==================
Personal dotfiles managed by Ansible.

how
===

stuff modules into a py-virtual environment
```
virtualenv ~/.ve/ans
source ~/.ve/ans/bin/activate
pip install ansible
```

shell-box
=========
lay down basic configs to a shell host..
```
ansible-playbook --limit x.x.x.x -i hosts/hosts --ask-sudo-pass shell-box.yml
```
