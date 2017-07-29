# ubuntu-dev environment setup

To build the image:
`docker build -t deep-dev .`

To run and mount development environment:
`docker run -itd --name=deep-dev -v ~/:/home/deepgrant -h deep-dev deep-dev /bin/bash`

To connect the the bash shell in the container:
`docker container attach deep-dev`
