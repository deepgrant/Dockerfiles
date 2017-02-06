#!/usr/bin/env bash
docker run -ti -p6080:6080 -v=/Users/linux:/home/deepgrant:rw -v=/Users/gmills/Development:/home/Development:rw -h deepgrant-dev ubuntu-dev-vnc 
