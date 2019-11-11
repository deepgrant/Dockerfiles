# ubuntu-dev environment setup

To build the image:
```
docker build --build-arg UserName=${USER} -t ubuntu-dev .
```

To run and mount development environment:
```
docker run -it -entrypoint=/bin/bash --dns=185.37.37.37 --mount type=bind,source=${HOME},target=/home/${USER},consistency=cached -h ubuntu-dev ubuntu-dev
```
