cmake_minimum_required(VERSION 3.16.3)
project(hello)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)

include(../../cmake/c_verify.cmake)
include(../../cmake/c_verify_clang_tidy.cmake)
include(../../cmake/c_verify_clang_format.cmake)

enable_c_verify()
enable_c_verify_clang_tidy()
enable_c_verify_clang_format()

add_subdirectory(source)
install(TARGETS hello DESTINATION ${PROJECT_BINARY_DIR}/lib)

add_custom_target(library-run-fix COMMAND make fix)
add_test(run-fix library-run-fix)
