cmake_minimum_required(VERSION 3.16.3)
project(cmake-c-verify)

install(FILES
  cmake/c_verify.cmake
  cmake/c_verify_clang_format.cmake
  cmake/c_verify_clang_tidy.cmake
  cmake/c_verify_path.cmake
  DESTINATION ${PROJECT_BINARY_DIR}/cmake)
