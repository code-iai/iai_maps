cmake_minimum_required(VERSION 2.4.6)
include($ENV{ROS_ROOT}/core/rosbuild/rosbuild.cmake)

rosbuild_init()

file(GLOB def_files ${CMAKE_CURRENT_SOURCE_DIR}/defs/*.xml
                    ${CMAKE_CURRENT_SOURCE_DIR}/robots/*groups*.xml)

file(GLOB xacros ${CMAKE_CURRENT_SOURCE_DIR}/robots/*.urdf.xml)

rosbuild_find_ros_package(xacro)

set(outfiles "")

foreach( _xacro ${xacros} )
  string(REPLACE ".urdf." ".expanded." _outfile ${_xacro})
  add_custom_command(
    OUTPUT ${_outfile}
    COMMAND ${xacro_PACKAGE_PATH}/xacro.py
    ARGS ${_xacro} > ${_outfile}
    DEPENDS ${_xacro} ${def_files})
  list(APPEND outfiles ${_outfile})
endforeach( _xacro)


rosbuild_find_ros_package(ias_knowledge_base)
rosbuild_include(rosprolog utils)

set( OWL_PATH_PREFIX ${ias_knowledge_base_PACKAGE_PATH} )
fix_ros_destination_path(OWL_PATH_PREFIX)

file(GLOB inputs owl/*.in)

foreach( _in ${inputs} )
  string(REPLACE ".in" "" _out ${_in})
  configure_file( ${_in} ${_out} )
endforeach( _in )

# replace path to local OWL files
rosbuild_find_ros_package(iai_maps)
set( LOCAL_PACKAGE_PATH ${iai_maps_PACKAGE_PATH} )
fix_ros_destination_path(LOCAL_PACKAGE_PATH)

file(GLOB inputs prolog/*.in)
foreach( _in ${inputs} )
  string(REPLACE ".in" "" _out ${_in})
  configure_file( ${_in} ${_out} )
endforeach( _in )

add_custom_target( expanded_defs ALL DEPENDS ${outfiles} )
