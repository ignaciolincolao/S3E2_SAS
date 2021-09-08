cmake_minimum_required(VERSION 3.0.0)
project(s3e2_sas VERSION 0.1.0)

include(CTest)
enable_testing()

file(GLOB files
     "*.h"
     "*.cpp"
)

add_executable(s3e2_sas ${files} alumnos_utm.txt colegios_utm.txt)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/data/alumnos_utm.txt
    ${CMAKE_CURRENT_BINARY_DIR} COPYONLY)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/data/colegios_utm.txt
    ${CMAKE_CURRENT_BINARY_DIR} COPYONLY)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
