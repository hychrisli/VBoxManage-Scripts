
VBoxManage startvm CMPE255 --type headless
VBoxManage controlvm <vm> poweroff
VBoxManage unregistervm --delete CMPE255

vboxmanage startvm CMPE255 --type headless

ssh -p <port> <username>@localhost

