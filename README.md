<p align="center">
  <img src="https://github.com/cppmf/artwork/raw/master/banner/SphinxDoc.cmake/SphinxDoc.png" height="100" />
</p>

<p align="center">
  CMake module to easily generate Sphinx + Doxygen documentation of your project
</p>

---

## Usage
The easiest way to use [SphinxDoc.cmake](https://github.com/cppmf/SphinxDoc.cmake) is by adding [GetCPM.cmake](https://github.com/cppmf/GetCPM.cmake) to your project.

First add GetCPM.cmake module :

```bash
mkdir cmake
wget -O cmake/GetCPM.cmake https://raw.githubusercontent.com/cppmf/GetCPM.cmake/master/GetCPM.cmake
```

Then add the following lines to the project's `CMakeLists.txt`.


```bash
# include CPM.cmake module
include(cmake/GetCPM.cmake)

# add SphinxDoc.cmake
CPMAddPackage(
  NAME SphinxDoc
  GITHUB_REPOSITORY cppmf/SphinxDoc.cmake
)

# Append cmake module
if(${SphinxDoc_ADDED})
    list(APPEND CMAKE_MODULE_PATH ${SphinxDoc_SOURCE_DIR}/cmake)
endif()

...

# Find Doxygen, Sphinx and breathe
find_package(Doxygen REQUIRED)
find_package(Sphinx REQUIRED breathe)

# customize Sphinx
set(SPHINX_AUTHOR "CppMF Team")

# Add target for generating documentation with Doxygen
doxygen_add_docs(
  ${PROJECT_NAME}_doxygen
  "include")

# Add target for generating documentation with Sphinx
sphinx_add_docs(
  ${PROJECT_NAME}_sphinx_doc
  BREATHE_PROJECTS ${PROJECT_NAME}_doxygen
  BUILDER html
  SOURCE_DIRECTORY "docs"
  OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/html"
)
```

## Customisation

Customisation can be done by setting the following variables: ```SPHINX_PROJECT```, ```SPHINX_AUTHOR```, ```SPHINX_COPYRIGHT```, ```SPHINX_VERSION```, ```SPHINX_RELEASE```, ```SPHINX_LANGUAGE```

or

Customisation can be done by creating your own ```conf.py``` file.

few examples are available in the [example](./example) folder.

## Credits

Original FindSphinx.cmake file from [k0ekk0ek](https://github.com/k0ekk0ek/cmake-sphinx/blob/master/cmake/Modules/FindSphinx.cmake).
