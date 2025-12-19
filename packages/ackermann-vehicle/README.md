# Ackermann Steering Vehicle Simulation in ROS2 Jazzy and Gazebo Sim Harmonic

This project simulates a custom four wheels vehicle with **Ackermann steering** using **ROS2 Jazzy** and the **Gazebo Harmonic**.

## Table of Contents
- [Features](#features)
  - [1 Ackermann Steering](#1-ackermann-steering)
  - [2 ROS2 Communication](#2-ros2-communication)
  - [3 Visualization](#6-visualization)

## Features
### 1. **Ackermann Steering**
- A basic four wheels vehicle model built with realistic Ackermann steering.

### 2. **ROS2 Communication**
- All sensor data and control signals are integrated into the ROS2 ecosystem for seamless interoperability.

### 3. **Visualization**
- Model and sensor data are visualize in **RViz2**.

## Requirements
- **ROS2 (Jazzy)**
- **Gazebo Sim Harmonic**

You can also refer to the `Dockerfile`. 

## Local Installation

1. Clone the repository:<br>
`git clone https://github.com/alitekes1/ackermann-vehicle-gzsim-ros2`<br>`cd ..`
2. Build the project:
`colcon build && source install/setup.bash`

## Docker Installation

You can also run the simulation using Docker, which ensures a consistent environment across different systems.

### Steps to Run with Docker
1. Clone the repository:
   ```bash
   mkdir -p ackermann_sim/src && cd ackermann_sim/src
   git clone https://github.com/alitekes1/ackermann-vehicle-gzsim-ros2
   cd ackermann-vehicle-gzsim-ros2
   ```

2. Build and run the Docker container:
   ```bash
      docker run -it \
      --name ackermann_sim \
      --hostname ackermann_sim \
      --env="DISPLAY=$DISPLAY" \
      --env="QT_X11_NO_MITSHM=1" \
      --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
      --privileged alitekes1/ackermann_sim:latest
   ```

3. If you want to additional terminal for same container
   ```bash
      docker exec -it ackermann_sim bash
   ```
   
> **Note:** Inside the container, you can run the simulation commands as normal.

## Usage

### 1. Basic Simulation and Manual Control

1.  Launch the simulation:
    ```bash
    ros2 launch ackermann-vehicle-bringup ackermann-vehicle-spawn.launch.py
    ```
2.  Control car:
    ```bash
    ros2 run teleop_twist_keyboard teleop_twist_keyboard
    ```

## Gallery

