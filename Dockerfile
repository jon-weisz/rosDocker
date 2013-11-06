# Name: rosDocker
# Description: installs full blown ROS into ubuntu precise environment
#
# VERSION       1
#
# Use the ubuntu base image

FROM ubuntu:precise

MAINTAINER Oleg Blinnikov, osblinnikov@gmail.com

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe restricted multiverse" > /etc/apt/sources.list
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu precise main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-get update

#install key ROS
RUN apt-get install -y wget
RUN wget http://packages.ros.org/ros.key -O - | apt-key add -

#to get rid of  "WARNING: The following packages cannot be authenticated!"
RUN apt-get remove debian-keyring debian-archive-keyring
RUN apt-get clean
RUN apt-get update
RUN apt-get install -y debian-keyring debian-archive-keyring

#install ROS
RUN apt-get install -y ros-hydro-ros-base

# Launch bash when launching the container
ADD startcontainer /usr/local/bin/startcontainer
RUN chmod 755 /usr/local/bin/startcontainer
CMD ["/bin/bash"]
ENTRYPOINT ["/usr/local/bin/startcontainer"]

