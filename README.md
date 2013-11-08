rosDocker
=========

Docker container for the ROS (Robot Operating System) hydro base. 

Built image is available from https://index.docker.io/u/oleg/ros/

To build container from dockerfile, type command in current directory:

     docker build -t ros .

To run the fresh built container simply run:

    ./run 

If you'd like to configure launch steps of the container, fix a `startcontainer`
script and rebuild the container
