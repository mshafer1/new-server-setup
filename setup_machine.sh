#!/bin/bash -v
set -e

mkdir --parent ~/scripts/

scripts_root="https://raw.githubusercontent.com/mshafer1/new-server-setup/main"

# utilities
curl "$scripts_root/_install_utilities.sh" | bash -

# nginx
curl "$scripts_root/_install_web_servers.sh" | bash -

# docker
curl "$scripts_root/_install_docker.sh" | bash -

# configure Git aliases
curl "https://gist.githubusercontent.com/mshafer1/c4ad7a6a3b287ec62bc7f5cf568e01ac/raw/3224ad66913be93137dc9729786c95e866fe9fcb/new_machine_git_setup.bash" | bash -

# configure bash aliases
curl "https://gist.githubusercontent.com/mshafer1/11c693baf0e0a70a83f208d4bdfc9554/raw/f9b93a5400822e70cf7aee25a7c6be510f32d34a/bash_aliases.sh" >> ~/.bash_aliases
source .bash_aliases

wget -P ~/scripts/ "$scripts_root/epyenv_install.sh"
chmod +x ~/scripts/epyenv_install.sh
ln -s ~/scripts/epyenv_install.sh /usr/bin/epyenv_install

for v in 3.6 3.7 3.8 3.9 3.10
do
 pyenv install "$v:latest"
done

# ssh key
curl "$scripts_root/_setup_ssh_key.sh" | bash -


# run updates on schedule
mkdir --parent /root/scripts
curl "$scripts_root/run_updates.sh" > /root/scripts/run_updates.sh
chmod +x /root/scripts/run_updates.sh
curl "$scripts_root/_setup_updates.sh" | bash -
