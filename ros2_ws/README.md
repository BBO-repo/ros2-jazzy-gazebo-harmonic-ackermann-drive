ROS2 workspace and packages and kept separated, to use the msbot package run:
```
ln -s /workspace/packages/msbot/ /workspace/msbot_ws/src/
cd /workspace/msbot_ws/
colcon build --symlink-install
```
