echo "Fixing error 'sudo: unable to resolve host x.x.x.x: Name or service not known'"
echo $(hostname -I | cut -d\  -f1) $(hostname) | sudo tee -a /etc/hosts
