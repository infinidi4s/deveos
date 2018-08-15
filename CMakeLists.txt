cmake_minimum_required( VERSION 3.5 )
project( DEVEOS )
enable_testing()

message(STATUS "CMAKE_CURRENT_SOURCE_DIR=" ${CMAKE_CURRENT_SOURCE_DIR})

# setup module paths
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/libraries/fc/CMakeModules")
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/CMakeModules")

# load modules
include( GNUInstallDirs )
include( VersionMacros )
include( SetupTargetMacros )
#include( InstallDirectoryPermissions )
#include( MASSigning )


set( CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} -Wall   -std=gnu++14" )
set( Boost_USE_STATIC_LIBS ON CACHE STRING "ON or OFF" )
set( CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static-libstdc++ -static-libgcc")
if( "${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang" )
  if( CMAKE_CXX_COMPILER_VERSION VERSION_EQUAL 4.0.0 OR CMAKE_CXX_COMPILER_VERSION VERSION_GREATER 4.0.0 )
    set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-invalid-partial-specialization" )
  endif()
endif()

find_package(Boost 1.67 REQUIRED COMPONENTS
    thread
    date_time
    filesystem
    system
    program_options
    signals
    serialization
    chrono
    unit_test_framework
    context
    locale
    iostreams)

add_subdirectory( libraries )

