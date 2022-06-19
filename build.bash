#!/bin/bash

set -x
set -e

# We create the initial docker image
docker build --no-cache -t workstation_tmp:initial .

# Setup VIM
docker run -it --name workstation_tmp workstation_tmp:initial nvim -u NONE '+source ~/.config/nvim/lua/plugins/init.lua' '+PackerSync'
docker commit workstation_tmp workstation_tmp:vim
docker container rm workstation_tmp

docker run -it --name workstation_tmp workstation_tmp:vim nvim '+LspInstallInfo'
docker commit workstation_tmp workstation_tmp:vim2
docker container rm workstation_tmp

# Setup TMUX
docker run -it --name workstation_tmp workstation_tmp:vim2 tmux
docker commit -c 'ENTRYPOINT bash' workstation_tmp workstation:latest
docker container rm workstation_tmp

# Clean
docker image rm workstation_tmp:initial
docker image rm workstation_tmp:vim
