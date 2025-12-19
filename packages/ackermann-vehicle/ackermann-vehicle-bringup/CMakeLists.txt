cmake_minimum_required(VERSION 3.5)

project(ackermann-vehicle-bringup)

find_package(ament_cmake REQUIRED)
find_package(ackermann-vehicle-description REQUIRED)

install(
  DIRECTORY
    launch
    rviz
    config
  DESTINATION share/${PROJECT_NAME}/
)

if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  ament_lint_auto_find_test_dependencies()
endif()

ament_package()
