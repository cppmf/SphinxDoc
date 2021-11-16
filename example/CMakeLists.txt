# ---------------------------------------------------------------------------- #
# CppMF projects are designed to apply modern CMake practice.
# As such, a decent CMake version is used to benefit from all new features.
#
# Check CMake Release Notes:
#   https://cmake.org/cmake/help/latest/release/3.21.html
# ---------------------------------------------------------------------------- #
cmake_minimum_required(VERSION 3.21 FATAL_ERROR)

# Make use of GetCPM.cmake
include(${CMAKE_CURRENT_LIST_DIR}/cmake/GetCPM.cmake)

# Add SphinxDoc.cmake package
CPMAddPackage(NAME SphinxDoc SOURCE_DIR ${CMAKE_CURRENT_LIST_DIR}/..)

# Add cmake module
if(${SphinxDoc_ADDED})
    list(APPEND CMAKE_MODULE_PATH ${SphinxDoc_SOURCE_DIR}/cmake)
endif()


# ---------------------------------------------------------------------------- #
# Project configuration
# ---------------------------------------------------------------------------- #
project(
  Sphinx_examples
  VERSION 1.0.0
  LANGUAGES CXX
)


# ---------------------------------------------------------------------------- #
# Add Sphinx_examples_lib target
# ---------------------------------------------------------------------------- #
# -- Source files
file(GLOB_RECURSE headers CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/include/*.h")
file(GLOB_RECURSE sources CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp")
# -- Create library
add_library(${PROJECT_NAME}_lib ${headers} ${sources})
# -- include directory location
target_include_directories(${PROJECT_NAME}_lib PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include/lib)


# ---------------------------------------------------------------------------- #
# Add Sphinx_examples_app target
# ---------------------------------------------------------------------------- #
add_executable(${PROJECT_NAME}_app src/main.cpp)


# ---------------------------------------------------------------------------- #
# Add Sphinx_examples_lib as a dependency for Sphinx_examples_app target
# ---------------------------------------------------------------------------- #
target_link_libraries (${PROJECT_NAME}_app ${PROJECT_NAME}_lib)


# ---------------------------------------------------------------------------- #
# Find Doxygen, Sphinx and breathe
# ---------------------------------------------------------------------------- #
find_package(Doxygen REQUIRED)
find_package(Sphinx REQUIRED breathe)


# ---------------------------------------------------------------------------- #
# customize Sphinx
# ---------------------------------------------------------------------------- #
set(SPHINX_AUTHOR "CppMF Team")


# ---------------------------------------------------------------------------- #
# Add target for generating documentation with Doxygen
# ---------------------------------------------------------------------------- #
doxygen_add_docs(
  ${PROJECT_NAME}_doxygen
  "include")


# ---------------------------------------------------------------------------- #
# Add target for generating documentation with Sphinx
# ---------------------------------------------------------------------------- #
sphinx_add_docs(
  ${PROJECT_NAME}_basic_sphinx_doc
  BREATHE_PROJECTS ${PROJECT_NAME}_doxygen
  BUILDER html
  SOURCE_DIRECTORY "docs/basic"
  OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/html/basic"
)
sphinx_add_docs(
  ${PROJECT_NAME}_amunra_sphinx_doc
  BREATHE_PROJECTS ${PROJECT_NAME}_doxygen
  BUILDER html
  SOURCE_DIRECTORY "docs/amunra"
  OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/html/amunra"
)
sphinx_add_docs(
        ${PROJECT_NAME}_material_sphinx_doc
        BREATHE_PROJECTS ${PROJECT_NAME}_doxygen
        BUILDER html
        SOURCE_DIRECTORY "docs/material"
        OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/html/material"
)
sphinx_add_docs(
        ${PROJECT_NAME}_rtd_sphinx_doc
        BREATHE_PROJECTS ${PROJECT_NAME}_doxygen
        BUILDER html
        SOURCE_DIRECTORY "docs/rtd"
        OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/html/rtd"
)