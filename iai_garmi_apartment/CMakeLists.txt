cmake_minimum_required(VERSION 3.5)
project(iai_garmi_apartment)

find_package(ament_cmake REQUIRED)

install(DIRECTORY mjcf
  DESTINATION share/${PROJECT_NAME})

ament_package()
