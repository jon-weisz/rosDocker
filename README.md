rosDocker
=========

Docker container for the ROS (Robot Operating System) hydro base. 

**No longer supported in favour**

https://registry.hub.docker.com/u/sigproc/ros/

====

To build container from dockerfile, type command in current directory:

     docker build -t oleg/ros .

To start the fresh built container simply type:

    ./run 

If you'd like to configure launch steps of the container, fix a `startcontainer`
script and rebuild the container

TODO
---

Figure out how to export ROS dynamic tcp/udp ports from docker container
