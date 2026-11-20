cmake_minimum_required(VERSION 3.5)
project(iai_objects)

find_package(ament_cmake REQUIRED)

install(DIRECTORY objects urdf
  DESTINATION share/${PROJECT_NAME})

ament_package()
