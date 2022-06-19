FROM alpine:3.16.0

# Updates
# See: https://wiki.alpinelinux.org/wiki/Upgrading_Alpine#Updating_package_lists
RUN apk update
RUN apk add --upgrade apk-tools
RUN apk upgrade --available

# Tools
RUN apk add bash
RUN apk add neovim
RUN apk add tmux
RUN apk add fzf
RUN apk add git
RUN apk add openssh
RUN apk add stow

# NodeJS
RUN apk add nodejs
RUN apk add npm

# Install and setup dotfiles
RUN cd ~ && git clone https://github.com/mdos-san/dotfiles.git
RUN cd ~/dotfiles && stow bash neovim tmux vim

# Setup git
RUN git config --global user.name "Mickael Dos Santos"
RUN git config --global user.email "mdossan@protonmail.com"

# Install Packer
# /!\ Setup will be made during ./build.bash script
RUN cd ~ && git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install Tpm
# /!\ Setup will be made during ./build.bash script
RUN cd ~ && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

WORKDIR /root/workstation

