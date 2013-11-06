rosDocker
=========

Docker container for the ROS (Robot Operating System). 

Build image is available from https://index.docker.io/u/oleg/ros/

To build container from dockerfile, type command in current directory:

     docker build -t ros .

To run the fresh build container simply run the command:

    ./run 

If you'd like to configure startup of the container with the default [command](http://docs.docker.io/en/latest/commandline/command/run/) argument, change the startcontainer
script and rebuild container
