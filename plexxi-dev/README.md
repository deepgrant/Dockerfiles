Building plexxi-dev environment
===============================

The assumptions here are you are installing on linux or macOS.

`$ docker build -t plexxi-dev .`

This will construct the plexxi-dev image with everything needed to develop and run the code.

We recommend you build a Volume to house your plexxi-dev user environment. This is useful when refreshing or rebuilding 
the plexxi-dev image and you wish to keep your bash history and local files. The alternative is to mount in a section of your
host systems filespace. 

To build a volume:

`$ docker volume create --name plexxi-dev-user-data`

Will construct and empty volume. You just need to do this the one time if you do not have one already.

If successful you should see it when you list the volumes.

```
$ docker volume ls
DRIVER              VOLUME NAME
local               control-py-postgres-data
local               plexxi-dev-user-data
```

Net make sure you have a postgres docker images running. This is trivial to do.

We will need a place to store the postgres database files. This is best housed in a volume. Create one. Viz:

`docker volume create --name control-py-postgres-data`

Next we run a postgres image. This will pull from `dockerhub` if you have not done this before.

```
$ docker run --name control-py-postgres -e POSTGRES_PASSWORD=plexxi123 -v control-py-postgres-data:/var/lib/postgresql/data -p 5432:5432 -d postgres
```

This image includes EXPOSE 5432 (the postgres port), so standard container linking will make it automatically available to the linked containers. 
The default postgres user and database are created in the entrypoint with initdb.

Now we can run and link our plexxi-dev docker instance to this docker instance.

```
$ docker run -itd --name=plexxi-dev --link control-py-postgres -v plexxi-dev-user-data:/home/plexxidev/ -v ~/Development/:/home/plexxidev/Development/ -h plexxi-dev plexxi-dev /bin/bash
```

**NOTE** that in this example the git workspace for the project is located in this hosts ~/Development directory and is 
mounted into the instance file system under /home/plexxiuser/

**NOTE** the Dockerfile used to create this instance assumes your UID and GID are 501 and 20 respectively. If this is not true
for you, go ahead and modidy the Dockerfile to reflect this. **WARNING** please do not push this back to the repo.

To attach to the the plexxi-dev container:
```
$ docker attach plexxi-dev
```

Hit return and you should be in the bash shell of this instance.
```
plexxidev@plexxi-dev:~$ 
```
