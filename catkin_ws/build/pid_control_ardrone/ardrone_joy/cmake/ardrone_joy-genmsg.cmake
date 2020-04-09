# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ardrone_joy: 2 messages, 1 services")

set(MSG_I_FLAGS "-Iardrone_joy:/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ardrone_joy_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/srv/GoToPose.srv" NAME_WE)
add_custom_target(_ardrone_joy_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ardrone_joy" "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/srv/GoToPose.srv" ""
)

get_filename_component(_filename "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/msg/IntList.msg" NAME_WE)
add_custom_target(_ardrone_joy_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ardrone_joy" "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/msg/IntList.msg" ""
)

get_filename_component(_filename "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/msg/AutoPilotCmd.msg" NAME_WE)
add_custom_target(_ardrone_joy_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ardrone_joy" "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/msg/AutoPilotCmd.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(ardrone_joy
  "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/msg/IntList.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ardrone_joy
)
_generate_msg_cpp(ardrone_joy
  "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/msg/AutoPilotCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ardrone_joy
)

### Generating Services
_generate_srv_cpp(ardrone_joy
  "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/srv/GoToPose.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ardrone_joy
)

### Generating Module File
_generate_module_cpp(ardrone_joy
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ardrone_joy
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ardrone_joy_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ardrone_joy_generate_messages ardrone_joy_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/srv/GoToPose.srv" NAME_WE)
add_dependencies(ardrone_joy_generate_messages_cpp _ardrone_joy_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/msg/IntList.msg" NAME_WE)
add_dependencies(ardrone_joy_generate_messages_cpp _ardrone_joy_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/msg/AutoPilotCmd.msg" NAME_WE)
add_dependencies(ardrone_joy_generate_messages_cpp _ardrone_joy_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ardrone_joy_gencpp)
add_dependencies(ardrone_joy_gencpp ardrone_joy_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ardrone_joy_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(ardrone_joy
  "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/msg/IntList.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ardrone_joy
)
_generate_msg_eus(ardrone_joy
  "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/msg/AutoPilotCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ardrone_joy
)

### Generating Services
_generate_srv_eus(ardrone_joy
  "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/srv/GoToPose.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ardrone_joy
)

### Generating Module File
_generate_module_eus(ardrone_joy
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ardrone_joy
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(ardrone_joy_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(ardrone_joy_generate_messages ardrone_joy_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/srv/GoToPose.srv" NAME_WE)
add_dependencies(ardrone_joy_generate_messages_eus _ardrone_joy_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/msg/IntList.msg" NAME_WE)
add_dependencies(ardrone_joy_generate_messages_eus _ardrone_joy_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/msg/AutoPilotCmd.msg" NAME_WE)
add_dependencies(ardrone_joy_generate_messages_eus _ardrone_joy_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ardrone_joy_geneus)
add_dependencies(ardrone_joy_geneus ardrone_joy_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ardrone_joy_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(ardrone_joy
  "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/msg/IntList.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ardrone_joy
)
_generate_msg_lisp(ardrone_joy
  "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/msg/AutoPilotCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ardrone_joy
)

### Generating Services
_generate_srv_lisp(ardrone_joy
  "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/srv/GoToPose.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ardrone_joy
)

### Generating Module File
_generate_module_lisp(ardrone_joy
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ardrone_joy
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ardrone_joy_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ardrone_joy_generate_messages ardrone_joy_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/srv/GoToPose.srv" NAME_WE)
add_dependencies(ardrone_joy_generate_messages_lisp _ardrone_joy_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/msg/IntList.msg" NAME_WE)
add_dependencies(ardrone_joy_generate_messages_lisp _ardrone_joy_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/msg/AutoPilotCmd.msg" NAME_WE)
add_dependencies(ardrone_joy_generate_messages_lisp _ardrone_joy_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ardrone_joy_genlisp)
add_dependencies(ardrone_joy_genlisp ardrone_joy_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ardrone_joy_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(ardrone_joy
  "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/msg/IntList.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ardrone_joy
)
_generate_msg_nodejs(ardrone_joy
  "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/msg/AutoPilotCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ardrone_joy
)

### Generating Services
_generate_srv_nodejs(ardrone_joy
  "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/srv/GoToPose.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ardrone_joy
)

### Generating Module File
_generate_module_nodejs(ardrone_joy
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ardrone_joy
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(ardrone_joy_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(ardrone_joy_generate_messages ardrone_joy_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/srv/GoToPose.srv" NAME_WE)
add_dependencies(ardrone_joy_generate_messages_nodejs _ardrone_joy_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/msg/IntList.msg" NAME_WE)
add_dependencies(ardrone_joy_generate_messages_nodejs _ardrone_joy_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/msg/AutoPilotCmd.msg" NAME_WE)
add_dependencies(ardrone_joy_generate_messages_nodejs _ardrone_joy_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ardrone_joy_gennodejs)
add_dependencies(ardrone_joy_gennodejs ardrone_joy_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ardrone_joy_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(ardrone_joy
  "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/msg/IntList.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ardrone_joy
)
_generate_msg_py(ardrone_joy
  "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/msg/AutoPilotCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ardrone_joy
)

### Generating Services
_generate_srv_py(ardrone_joy
  "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/srv/GoToPose.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ardrone_joy
)

### Generating Module File
_generate_module_py(ardrone_joy
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ardrone_joy
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ardrone_joy_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ardrone_joy_generate_messages ardrone_joy_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/srv/GoToPose.srv" NAME_WE)
add_dependencies(ardrone_joy_generate_messages_py _ardrone_joy_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/msg/IntList.msg" NAME_WE)
add_dependencies(ardrone_joy_generate_messages_py _ardrone_joy_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/apollo/catkin_ws/src/pid_control_ardrone/ardrone_joy/msg/AutoPilotCmd.msg" NAME_WE)
add_dependencies(ardrone_joy_generate_messages_py _ardrone_joy_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ardrone_joy_genpy)
add_dependencies(ardrone_joy_genpy ardrone_joy_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ardrone_joy_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ardrone_joy)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ardrone_joy
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(ardrone_joy_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ardrone_joy)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ardrone_joy
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(ardrone_joy_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ardrone_joy)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ardrone_joy
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(ardrone_joy_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ardrone_joy)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ardrone_joy
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(ardrone_joy_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ardrone_joy)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ardrone_joy\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ardrone_joy
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(ardrone_joy_generate_messages_py std_msgs_generate_messages_py)
endif()
