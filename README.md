# ros2-jazzy-multi-sensor-robot
A ROS 2 Jazzy package for simulate ackerdrive robot.
TODO: Add some sensors and worlds to illustrate SLAM

![gazebo-rviz-acker-drive](assets/gazebo-rviz-acker-drive.gif)

To run the Gazebo Rviz demo log into the Docker container terminal and run:
```
cd /workspace/ros2_ws/
colcon build --symlink-install
source install/setup.bash
ros2 launch msbot_bringup sim.launch.py
```
To move the robot, make sure Gazebo is running by pressing the play button in Gazebo opened GUI and from another terminal in container run:
```
gz topic -t "model/msbot/cmd_vel" -m gz.msgs.Twist -p "linear: {x: 0.5}, angular: {z: 0.05}"
```