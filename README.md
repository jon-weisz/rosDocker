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

    docker commit --author="FIXME" --message="FIXME" FIXME_75f05d8f7da3 oleg/ros:FIXME

Note, for starting master and child nodes in the same container use preinstalled `tmux` multiplexer of consoles

TODO
---

Figure out how to export ROS dynamic tcp/udp ports from docker container
