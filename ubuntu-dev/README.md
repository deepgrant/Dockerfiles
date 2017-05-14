# ubuntu-dev environment setup

To build the image:
`docker build -t ubuntu-dev .`

To run and mount development environment:
`docker run -itd --name=ubuntu-dev -v ~/:/home/deepgrant -h ubuntu-dev ubuntu-dev /bin/bash`

