#!/bin/bash

# Ensure that the following actions
# are made relative to this file's path.
cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

ask_for_sudo

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n • Create directories\n\n"
mkdir -p "$HOME/dev/ibm"
#      └─ make parent directories if needed

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n • Create symbolic links\n\n"
# Create the necessary symbolic links between the `.dotfiles` and `HOME`
# directory.
ln -fs "./shell/.bash_logout" "$HOME/.bash_logout"
ln -fs "./shell/.bash_profile" "$HOME/.bash_profile"
ln -fs "./shell/.bash_prompt" "$HOME/.bash_prompt"
ln -fs "./shell/.bashrc" "$HOME/.bashrc"
ln -fs "./shell/.inputrc" "$HOME/.inputrc"
ln -fs "./shell/.hushlogin" "$HOME/.hushlogin"

ln -fs "./git/.gitattributes" "$HOME/.gitattributes"
ln -fs "./git/.gitconfig-ibm" "$HOME/.gitconfig-ibm"
ln -fs "./git/.gitconfig" "$HOME/.gitconfig"
ln -fs "./git/.gitignore" "$HOME/.gitignore"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n • Install nvm and node\n\n"

execute \
        "curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash" \
        "Install nvm"

# Make nvm command available to terminal
. ~/.nvm/nvm.sh

execute \
        "nvm install stable" \
        "Install node stable"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


./homebrew.sh
./install.sh
./preferences.sh

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n • Restart\n\n"

ask_for_confirmation "Do you want to restart?"
printf "\n"

if answer_is_yes; then
    sudo shutdown -r now &> /dev/null
fi