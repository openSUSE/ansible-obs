[![CircleCI](https://circleci.com/gh/openSUSE/ansible-obs.svg?style=svg)](https://circleci.com/gh/openSUSE/ansible-obs)

## How to run it in production, using Docker:

First build the image with:

```
docker-compose build --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) ansible-obs
```

Go to the root directory of the project:

```
$ cd <path_to_project>/ansible-obs/
```

run

```
docker-compose run --rm -u $(whoami) ansible-obs
```

Then, inside the container...

go to

```
$ cd /home/$(whoami)/ansible-obs
```

you should list all the `obs_deploy` commands by running

```
bin/obs_deploy
```

Now if, your VPN is up and running, you are able to call `ssh root@obs` from the container.

Go to the [Wiki](https://github.com/openSUSE/open-build-service/wiki/Deployment-of-build.opensuse.org) to read more about how to deploy with `ansible-obs`.
