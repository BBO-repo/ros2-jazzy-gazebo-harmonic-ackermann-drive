# ROS2 Jazzy and Gazebo Harmonic simulation of 4 wheeled ackermann drive robot vehicle
A ROS 2 Jazzy package for simulate a four wheeled ackermann drive robot within Gazebo Harmonic simulator.<br>

The project works out of the box in a docker container built with the provided Dockerfile.<br>
This package is intended to be used as a template to build some more sophisticated vehicle robots with diverses sensors added on top of it.<br><br>


![gazebo-rviz-acker-drive](assets/gazebo-rviz-acker-drive.gif)

<br>

To run the Gazebo Rviz demo, just log into the docker container built with the `Dockerfile` terminal and run:
```sh
cd /workspace/ros2_ws/
colcon build --symlink-install
source install/setup.bash
ros2 launch ackermann-vehicle-bringup ackermann-vehicle-spawn.launch.py
```
Note: To move the robot, make sure Gazebo is running by pressing the play button in Gazebo opened GUI.<br>

In a terminal inside the container, just run:
```sh
gz topic -t "/cmd_vel" -m gz.msgs.Twist -p "linear: {x: 0.5}, angular: {z: 0.05}"
```

Note: You could also send messages directly from ros2:
```sh
ros2 topic pub /cmd_vel geometry_msgs/msg/Twist "{linear: {x: 0.5, y: 0.0, z: 0.0}, angular: {x: 0.0, y: 0.0, z: 0.1}}"
```