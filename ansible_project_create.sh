# by: Thanura Rukshan
#!/bin/bash

# Variables (change these according to your requirements)
ansible_root_directory="/path/to/ansible/root"
ansible_project_name="your_ansible_project"
ansible_roles=("role1" "role2" "role3")  # Add your roles here ("role1" "role2" "role3")

cd "$ansible_root_directory" || exit

mkdir -p "$ansible_project_name"
cd "$ansible_project_name" || exit
mkdir ansible_collections ext group_vars playbooks
touch README.md ansible.cfg

cd playbooks || exit
mkdir roles
touch dev.ini production.ini site.yml staging.ini

cd roles || exit

if [ "${#ansible_roles[@]}" -ne 0 ]; then
    for role in "${ansible_roles[@]}"; do
        ansible-galaxy init "$role"
    done
fi

echo "Ansible project structure created successfully."

