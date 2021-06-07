# 2021/0607 komizo
# For test use of ROS2
# You can do ros2 command in a container.
# ref: https://gbiggs.github.io/rosjp_ros2_intro/computer_prep_linux.html

# usage
# step1. docker build -t `image name` .
# step2. docker run --rm -it `image name` /bin/bash


FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y curl gnupg2 lsb-release
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
RUN sh -c 'echo "deb [arch=$(dpkg --print-architecture)] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-latest.list'
RUN apt-get update && apt-get install -y ros-foxy-desktop python3-colcon-common-extensions
RUN echo "source /opt/ros/foxy/setup.bash" >> ~/.bashrc
# RUN source ~/.bashrc
