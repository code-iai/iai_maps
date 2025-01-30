cmake_minimum_required(VERSION 3.5)
project(iai_refills_lab)

## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(ament_cmake REQUIRED)
find_package(xacro REQUIRED)

# xacro_add_xacro_file(urdf/apartment.xacro urdf/apartment.urdf)
# add target to trigger xacro
# add_custom_target(xacro ALL DEPENDS
#   urdf/apartment.urdf)

############
# Install  #
#############

install(DIRECTORY maps
DESTINATION share/${PROJECT_NAME})

install(DIRECTORY urdf
  DESTINATION share/${PROJECT_NAME})

install(DIRECTORY script
DESTINATION share/${PROJECT_NAME})


ament_package()
