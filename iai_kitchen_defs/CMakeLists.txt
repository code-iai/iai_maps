
cmake_minimum_required(VERSION 2.8.3)
project(iai_semantic_maps)

find_package(catkin REQUIRED COMPONENTS xacro)

catkin_package(
    DEPENDS xacro
)


# 
# file(GLOB def_files ${CMAKE_CURRENT_SOURCE_DIR}/defs/*.xml
#                     ${CMAKE_CURRENT_SOURCE_DIR}/robots/*groups*.xml)
# 
# file(GLOB xacros ${CMAKE_CURRENT_SOURCE_DIR}/robots/*.urdf.xml)
# 
# 
# 
# set(outfiles "")
# 
# foreach( _xacro ${xacros} )
#   string(REPLACE ".urdf." ".expanded." _outfile ${_xacro})
#   add_custom_command(
#     OUTPUT ${_outfile}
#     COMMAND ${xacro_PACKAGE_PATH}/xacro.py
#     ARGS ${_xacro} > ${_outfile}
#     DEPENDS ${_xacro} ${def_files})
#   list(APPEND outfiles ${_outfile})
# endforeach( _xacro)
# 
# add_custom_target( expanded_defs ALL DEPENDS ${outfiles} )
# 

# 
# 
# 
# # Generate .world files from .world.xacro files
# find_package(xacro REQUIRED)
# # You can also add xacro to the list of catkin packages:
# #   find_package(catkin REQUIRED COMPONENTS ... xacro)
# 
# set(world_files "")
# 
# # Xacro files
# file(GLOB model_xacro_files ${CMAKE_CURRENT_SOURCE_DIR}/worlds/*/*.xacro)
# 
# # Dependency files
# file(GLOB world_xacro_files ${CMAKE_CURRENT_SOURCE_DIR}/worlds/*.world.xacro)
# 
# foreach(it ${world_xacro_files})
#   get_filename_component(basepath ${it} PATH)
#   get_filename_component(basename ${it} NAME_WE)
# 
#   message(" processing world file :",${basepath}," : ",${basename})
# 
#   set(expanded_file "${basepath}/${basename}.world")
#   message("    produce expanded file :", ${expanded_file})
# 
#   xacro_add_xacro_file(${it} ${expanded_file})
# 
#   set(world_files ${world_files} ${expanded_file})
# endforeach(it)
# 
# add_custom_target(media_files ALL DEPENDS ${world_files})
# 
