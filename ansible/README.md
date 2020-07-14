# Ansible 2
Playbook and roles based on Ansible 2. It requires the *boto* library installed to work with AWS API.

The following packages are required the playbooks to work:

## Installation

```
boto
```

## Run playbooks

```
ansible-playbook -i inventories/aws/ playbooks/github-actions-runner.yml -l tag_Name_xxx_a_01
```

## SSH Config
SSH config should be setup like this to work.

```
Host *
  ForwardAgent yes
  UseKeychain yes
  AddKeysToAgent yes
```