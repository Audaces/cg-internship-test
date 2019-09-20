cmake_minimum_required(VERSION 3.6)

project(audaces-cg-internship-test)

set(CMAKE_DEBUG_POSTFIX _d)
set(THIRDPARTY_DIR ${CMAKE_CURRENT_SOURCE_DIR}/thirdparty)

list(APPEND CMAKE_MODULE_PATH "${THIRDPARTY_DIR}/cmake-scripts")
include(target_libraries)

find_package(OpenGL REQUIRED)

add_subdirectory(${THIRDPARTY_DIR}/glew)
add_subdirectory(${THIRDPARTY_DIR}/glfw)

include_directories(${THIRDPARTY_DIR}/glew/include)
include_directories(${THIRDPARTY_DIR}/glfw/include)

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    set(GLEW_LIB_NAME glew64)
else()
    set(GLEW_LIB_NAME glew32)
endif()

set(THIRDPARTY_LIBS ${OPENGL_LIBRARY} ${GLEW_LIB_NAME} glfw ${GLFW_LIBRARIES})

file(GLOB_RECURSE SRC_FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cc)

add_executable(${PROJECT_NAME} ${SRC_FILES})
target_link_libraries(${PROJECT_NAME} ${THIRDPARTY_LIBS})

if (MSVC)
	set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT ${PROJECT_NAME})
	TARGET_DYNAMIC_LIBRARIES(${PROJECT_NAME} ${GLEW_LIB_NAME} glfw)
endif()

install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION bin LIBRARY DESTINATION lib ARCHIVE DESTINATION lib)