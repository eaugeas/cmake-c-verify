include(ExternalProject)

set(HELLO_BINARY_DIR ${PROJECT_BINARY_DIR}/library-prefix/src/library-build)
include_directories(${HELLO_BINARY_DIR}/source)
link_directories(${HELLO_BINARY_DIR}/lib)
set(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH}:${HELLO_BINARY_DIR})

ExternalProject_Add(library
  SOURCE_DIR ../../library
)
