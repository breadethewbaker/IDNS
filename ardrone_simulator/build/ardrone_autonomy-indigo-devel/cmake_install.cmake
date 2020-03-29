# Install script for directory: /home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/zhu/ardrone_simulator/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ardrone_autonomy/srv" TYPE FILE FILES
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/srv/CamSelect.srv"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/srv/FlightAnim.srv"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/srv/LedAnim.srv"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/srv/RecordEnable.srv"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ardrone_autonomy/msg" TYPE FILE FILES
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/msg/matrix33.msg"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/msg/navdata_adc_data_frame.msg"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/msg/navdata_altitude.msg"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/msg/navdata_demo.msg"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/msg/navdata_euler_angles.msg"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/msg/navdata_games.msg"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/msg/navdata_gyros_offsets.msg"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/msg/navdata_hdvideo_stream.msg"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/msg/navdata_kalman_pressure.msg"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/msg/navdata_magneto.msg"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/msg/Navdata.msg"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/msg/navdata_phys_measures.msg"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/msg/navdata_pressure_raw.msg"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/msg/navdata_pwm.msg"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/msg/navdata_raw_measures.msg"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/msg/navdata_rc_references.msg"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/msg/navdata_references.msg"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/msg/navdata_time.msg"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/msg/navdata_trackers_send.msg"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/msg/navdata_trims.msg"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/msg/navdata_video_stream.msg"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/msg/navdata_vision_detect.msg"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/msg/navdata_vision.msg"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/msg/navdata_vision_of.msg"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/msg/navdata_vision_perf.msg"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/msg/navdata_vision_raw.msg"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/msg/navdata_watchdog.msg"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/msg/navdata_wifi.msg"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/msg/navdata_wind_speed.msg"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/msg/navdata_zimmu_3000.msg"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/msg/vector21.msg"
    "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/msg/vector31.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ardrone_autonomy/cmake" TYPE FILE FILES "/home/zhu/ardrone_simulator/build/ardrone_autonomy-indigo-devel/catkin_generated/installspace/ardrone_autonomy-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/zhu/ardrone_simulator/devel/include/ardrone_autonomy")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/zhu/ardrone_simulator/devel/share/roseus/ros/ardrone_autonomy")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/zhu/ardrone_simulator/devel/share/common-lisp/ros/ardrone_autonomy")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/zhu/ardrone_simulator/devel/share/gennodejs/ros/ardrone_autonomy")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/zhu/ardrone_simulator/devel/lib/python2.7/dist-packages/ardrone_autonomy")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/zhu/ardrone_simulator/devel/lib/python2.7/dist-packages/ardrone_autonomy")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/zhu/ardrone_simulator/build/ardrone_autonomy-indigo-devel/catkin_generated/installspace/ardrone_autonomy.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ardrone_autonomy/cmake" TYPE FILE FILES "/home/zhu/ardrone_simulator/build/ardrone_autonomy-indigo-devel/catkin_generated/installspace/ardrone_autonomy-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ardrone_autonomy/cmake" TYPE FILE FILES
    "/home/zhu/ardrone_simulator/build/ardrone_autonomy-indigo-devel/catkin_generated/installspace/ardrone_autonomyConfig.cmake"
    "/home/zhu/ardrone_simulator/build/ardrone_autonomy-indigo-devel/catkin_generated/installspace/ardrone_autonomyConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ardrone_autonomy" TYPE FILE FILES "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/package.xml")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/ardrone_autonomy/ardrone_driver" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/ardrone_autonomy/ardrone_driver")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/ardrone_autonomy/ardrone_driver"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/ardrone_autonomy" TYPE EXECUTABLE FILES "/home/zhu/ardrone_simulator/devel/lib/ardrone_autonomy/ardrone_driver")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/ardrone_autonomy/ardrone_driver" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/ardrone_autonomy/ardrone_driver")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/ardrone_autonomy/ardrone_driver"
         OLD_RPATH "/home/zhu/ardrone_simulator/devel/lib/ardrone:/opt/ros/kinetic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/ardrone_autonomy/ardrone_driver")
    endif()
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ardrone_autonomy/launch" TYPE DIRECTORY FILES "/home/zhu/ardrone_simulator/src/ardrone_autonomy-indigo-devel/launch/" REGEX "/\\.git$" EXCLUDE)
endif()

