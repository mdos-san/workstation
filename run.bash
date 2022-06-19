#!/bin/bash

docker run -it --rm --net host -v ~/.ssh:/root/.ssh -v ~/workstation:/root/workstation --name workstation workstation bash
