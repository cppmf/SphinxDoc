# ---------------------------------------------------------------------------- #
#
# Copyright (c) 2020 C++ Modern Framework
#
# ---------------------------------------------------------------------------- #

# ---------------------------------------------------------------------------- #
# customize Doxygen
# https://cmake.org/cmake/help/latest/module/FindDoxygen.html
# ---------------------------------------------------------------------------- #

set(DOXYGEN_GENERATE_HTML NO CACHE INTERNAL "Doxygen do not generate html (required by doxygen_add_docs)")
set(DOXYGEN_GENERATE_XML YES CACHE INTERNAL "Doxygen generate xml (required by doxygen_add_docs)")
set(DOXYGEN_VERBATIM_HEADERS NO CACHE INTERNAL "Prevent sources  header files will be included in the docs)")
