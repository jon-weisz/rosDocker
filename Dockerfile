# Name: rosDocker
# Description: installs ROS-hydro base in ubuntu precise environment
#
# VERSION       1.1
#

# Use the ubuntu base image
FROM ubuntu:precise

MAINTAINER Oleg Blinnikov, osblinnikov@gmail.com

# make sure the package repository is up to date
RUN apt-get -y update
RUN apt-get install -y debian-keyring debian-archive-keyring

#install ROS key
RUN apt-get install -y wget
RUN wget http://packages.ros.org/ros.key -O - | apt-key add -

#for TESTS of exposing port
RUN apt-get install -y netcat

#update ros repository
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu precise main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-get update

#install ROS
RUN apt-get install -y ros-hydro-ros-base

# Install additional useful packages
RUN apt-get -y install bash-completion git build-essential vim

# Initialise rosdep
RUN rosdep init

# Now create the ros user itself
RUN adduser --gecos "ROS User" --disabled-password ros
RUN usermod -a -G dialout ros

# And, as that user...
USER ros

# HOME needs to be set explicitly. Without it, the HOME environment variable is
# set to "/"
RUN HOME=/home/ros rosdep update

# Create a ROS workspace for the ROS user.
RUN mkdir -p /home/ros/workspace/src
RUN /bin/bash -c '. /opt/ros/hydro/setup.bash; catkin_init_workspace /home/ros/workspace/src'
RUN /bin/bash -c '. /opt/ros/hydro/setup.bash; cd /home/ros/workspace; catkin_make'
RUN echo "source ~/workspace/devel/setup.bash" >> /home/ros/.bashrc

# Launch bash when launching the container
ADD startcontainer /usr/local/bin/startcontainer
RUN chmod 755 /usr/local/bin/startcontainer
CMD ["/bin/bash"]
ENTRYPOINT ["/usr/local/bin/startcontainer"]



