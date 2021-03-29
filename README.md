== How to run it in production, using Docker:

First build the image with:

```
docker-compose build --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) ansible-obs
```

Then run it with:


Inside the container, install ruby dependencies as:

```

  $ cd /home/$(whoami)/ansible-obs/

  docker-compose run --rm -u $(whoami) ansible-obs

```

and now inside the `/home/$(whoami)/ansible-obs`, you should be able to run
`bin/obs_deploy`

Now if, your VPN is up and running, you are able to call: `ssh root@obs` on the
container


== How to Setup the Staging environment:


Install ansible locally with zypper

```zypper in ansible ruby```

Run bundle install to install some ruby dependencies:

```bundle install --binstubs```

Install Virtualbox (or qemu)

Setup the Virtual Machine using an image from http://download.opensuse.org/repositories/OBS:/Server:/Unstable/images/. Set at least 3072 MB RAM, to be able to `zypper up obs-api` without any issue.

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

Add the following to your `.bashrc`

```
export RAILS_ENV=production

API_ROOT=/srv/www/obs/api

function run_in_api
{
  # startproc only works for classical daemons
  chroot --userspec=wwwrun:www / /bin/bash -c "export HOME=/var/lib/wwwrun; cd $API_ROOT && /usr/bin/bundle.ruby2.5 exec $*"
}

```

Try to run `run_in_api rails c` on the VM and it should work


Run the playbook:

```
ansible-playbook -i inventory/staging.yml deploy_without_migration.yml -vv
```

... do whatever you want with the VM ...

Rollback the VM to the initial snapshot

Please check our [wiki](https://github.com/openSUSE/ansible-obs/wiki) for more informations
