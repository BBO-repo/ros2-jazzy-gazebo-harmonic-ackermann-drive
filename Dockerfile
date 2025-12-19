# Use Ubuntu 24.04 as the base image
FROM ubuntu:24.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV ROS_DOMAIN_ID=0

# Install ROS 2 Jazzy dependencies
RUN apt-get update && \
    apt-get install -y \
    locales \
    sudo \
    curl \
    gnupg2 \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

# Set up locales
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen

# Add ROS 2 repository
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" > /etc/apt/sources.list.d/ros2.list

# Add Gazebo repository
RUN curl -sSL https://packages.osrfoundation.org/gazebo.gpg --output /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" > /etc/apt/sources.list.d/gazebo-stable.list

# Install ROS 2 Jazzy and Gazebo Harmonic
RUN apt-get update && \
    apt-get install -y \
    ros-jazzy-desktop \
    gz-harmonic \
    ros-jazzy-ros-gz \
    python3-colcon-common-extensions \
    build-essential \
    bash-completion \
    git \
    && rm -rf /var/lib/apt/lists/*

    # Source the ROS 2 environment
RUN echo "source /opt/ros/jazzy/setup.bash" >> /root/.bashrc

# Create a ROS 2 workspace
WORKDIR /workspace

# Set the entrypoint to source the ROS 2 environment
ENTRYPOINT ["/bin/bash", "-c", "source /opt/ros/jazzy/setup.bash && exec \"$@\""]