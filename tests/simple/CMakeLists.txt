cmake_minimum_required(VERSION 3.16.3)
project(simple)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)

include(../../cmake/c_verify.cmake)
include(../../cmake/c_verify_clang_tidy.cmake)
include(../../cmake/c_verify_clang_format.cmake)

enable_c_verify()
enable_c_verify_clang_tidy()
enable_c_verify_clang_format()

include (cmake/include_library.cmake)
add_subdirectory(source)
