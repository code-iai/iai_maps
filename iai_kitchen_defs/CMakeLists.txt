
cmake_minimum_required(VERSION 2.8.3)
project(iai_kitchen_defs)

find_package(catkin REQUIRED COMPONENTS xacro)

catkin_package(
    DEPENDS xacro
)
