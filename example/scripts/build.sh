#!/bin/bash

# Build the test project
cmake -S ".." -B "../build"
cmake --build "../build"
#cmake --build "../build" --target Sphinx_examples_basic_sphinx_doc
#cmake --build "../build" --target Sphinx_examples_amunra_sphinx_doc
#cmake --build "../build" --target Sphinx_examples_material_sphinx_doc
#cmake --build "../build" --target Sphinx_examples_rtd_sphinx_doc
