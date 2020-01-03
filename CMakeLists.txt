cmake_minimum_required(VERSION 3.3)
project(imu_3dm_gx4)

set(CMAKE_CXX_STANDARD 11)

find_package(catkin REQUIRED
             COMPONENTS 

                        roscpp
                        tf2_ros
                        std_msgs
                        sensor_msgs
                        geometry_msgs
                        diagnostic_updater
                        message_generation
                        message_filters)

add_message_files(DIRECTORY msg)
generate_messages(DEPENDENCIES geometry_msgs)

catkin_package(CATKIN_DEPENDS message_runtime geometry_msgs sensor_msgs)
include_directories(${catkin_INCLUDE_DIRS})

add_executable(${PROJECT_NAME} src/imu_3dm_gx4.cpp src/imu.cpp)
target_link_libraries(${PROJECT_NAME} ${catkin_LIBRARIES})

add_executable(merge_imu_filter src/merge_imu_filter.cpp)
target_link_libraries(merge_imu_filter ${catkin_LIBRARIES})


add_dependencies(${PROJECT_NAME} ${${PROJECT_NAME}_EXPORTED_TARGETS}
                 ${catkin_EXPORTED_TARGETS})

catkin_install_python(PROGRAMS script/add_rule
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

install(FILES script/imu_3dm_gx4.rules
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

install(TARGETS 
  ${PROJECT_NAME} 
  merge_imu_filter
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

install(DIRECTORY launch/
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/launch
)
