# Name: rosDocker
# Description: installs ROS-hydro base in ubuntu precise environment
#
# VERSION       1
#

# Use the ubuntu base image
FROM ubuntu:precise

MAINTAINER Oleg Blinnikov, osblinnikov@gmail.com

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe restricted multiverse" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y debian-keyring debian-archive-keyring


#install ROS key
RUN apt-get install -y wget
RUN wget http://packages.ros.org/ros.key -O - | apt-key add -

#update ros repository
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu precise main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-get update

#install ROS
RUN apt-get install -y ros-hydro-ros-base

#for TESTS of exposing port
RUN apt-get install -y netcat


# Launch bash when launching the container
ADD startcontainer /usr/local/bin/startcontainer
RUN chmod 755 /usr/local/bin/startcontainer
CMD ["/bin/bash"]
ENTRYPOINT ["/usr/local/bin/startcontainer"]



