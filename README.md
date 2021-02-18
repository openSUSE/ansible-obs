How to Setup the Staging environment:

Install ansible locally with zypper

```zypper in ansible```

Install Virtualbox (or qemu)

Setup the Virtual Machine using an image from http://download.opensuse.org/repositories/OBS:/Server:/Unstable/images/

Enable/start ssh on the virtual machine

Set a port forwarding from your host (2222) to your VM (22). A call to `ssh
root@localhost -p 2222` should make you ssh into your virtual machine

Set a port forwarding from your host (8443) to your VM (443). Trying to open the site https://localhost:8443 should lead you to your virtual machine

Set ssh authentication using key

Test ansible:

```
ansible obs -i inventory/staging.yml -a "hostnamectl"
```

The command will be sent via ssh to your VM.

Generate a snapshot from your VM

Run the playbook:

```
ansible-playbook -i inventory/staging.yml deploy_without_migration.yml -vv
```

... do whatever you want with the VM ...

Rollback the VM to the initial snapshot

Please check our wiki for more informations
