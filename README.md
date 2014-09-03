rosDocker
=========

Docker container for the ROS (Robot Operating System) hydro base.

====

To build container from dockerfile, type command in current directory:

     docker build -t oleg/ros .

To start the fresh built container simply type:

    ./run 

If you'd like to configure launch steps of the container, fix a `startcontainer`
script and rebuild the container

Commit:

    docker commit --author="MIXME" --message="MIXME" FIXME_75f05d8f7da3 oleg/ros:MIXME

TODO
---

Figure out how to export ROS dynamic tcp/udp ports from docker container
