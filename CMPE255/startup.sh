#!/bin/bash

# commands
vboxmanage startvm CMPE255 --type headless

# ssh login
ssh -p 2222 <user>@localhost

# start jupyter notebook
jupyter notebook --no-browser --port=8889

# jupyter notebook ssh tunneling
ssh -N -f -L 9999:localhost:8889 -p 2222 <user>@localhost

# find and remove service on port 9999
netstat -tulpn | grep :9999
