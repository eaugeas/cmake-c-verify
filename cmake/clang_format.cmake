find_program(CLANG_FORMAT "clang-format")
if(NOT CLANG_TIDY)
  macro(c_verify_clang_format_check name)
  endmacro()

  macro(c_verify_clang_format_fix name)
  endmacro()

  macro(c_verify_clang_format name)
  endmacro()

  macro(enable_c_verify_clang_format_check)
    message(WARNING "clang-format not found")
  endmacro()

  macro(enable_c_verify_clang_format_fix)
    message(WARNING "clang-format not found")
  endmacro()

  macro(enable_c_verify_clang_format)
    enable_c_verify_clang_format_check()
    enable_c_verify_clang_format_fix()
  endmacro()

  return()
endif()

include(${CMAKE_CURRENT_LIST_DIR}/verify.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/path.cmake)

macro(c_verify_clang_format_check name)
  add_custom_target(c-verify-clang-format-check-${name}-target)
  c_verify_are_source_files_present(are_source_files_present ${CMAKE_CURRENT_SOURCE_DIR})
  c_verify_are_header_files_present(are_header_files_present ${CMAKE_CURRENT_SOURCE_DIR})

  if (are_source_files_present)
    add_custom_target(c-verify-clang-format-check-sources-${name}-target
      COMMAND clang-format --Werror --dry-run ${CMAKE_CURRENT_SOURCE_DIR}/*.c)
    add_dependencies(c-verify-clang-format-check-${name}-target c-verify-clang-format-check-sources-${name}-target)
  endif()

  if (are_header_files_present)
    add_custom_target(c-verify-clang-format-check-headers-${name}-target
      COMMAND clang-format --Werror --dry-run ${CMAKE_CURRENT_SOURCE_DIR}/*.h)
    add_dependencies(c-verify-clang-format-check-${name}-target c-verify-clang-format-check-headers-${name}-target)
  endif()

  add_dependencies(c-verify-clang-format-check-target c-verify-clang-format-check-${name}-target)
endmacro()

macro(c_verify_clang_format_fix name)
  add_custom_target(c-verify-clang-format-fix-${name}-target)
  c_verify_are_source_files_present(are_source_files_present ${CMAKE_CURRENT_SOURCE_DIR})
  c_verify_are_header_files_present(are_header_files_present ${CMAKE_CURRENT_SOURCE_DIR})

  if (are_source_files_present)
    add_custom_target(c-verify-clang-format-fix-sources-${name}-target
      COMMAND clang-format -i ${CMAKE_CURRENT_SOURCE_DIR}/*.c)
    add_dependencies(c-verify-clang-format-fix-${name}-target c-verify-clang-format-fix-sources-${name}-target)
  endif()

  if (are_header_files_present)
    add_custom_target(c-verify-clang-format-fix-headers-${name}-target
      COMMAND clang-format -i ${CMAKE_CURRENT_SOURCE_DIR}/*.h)
    add_dependencies(c-verify-clang-format-fix-${name}-target c-verify-clang-format-fix-headers-${name}-target)
  endif()

  add_dependencies(c-verify-clang-format-fix-target c-verify-clang-format-fix-${name}-target)
endmacro()

macro(c_verify_clang_format name)
  c_verify_clang_format_check(${name})
  c_verify_clang_format_fix(${name})
endmacro()

macro(enable_c_verify_clang_format_check)
  add_custom_target(c-verify-clang-format-check-target)
  c_verify_check(c-verify-clang-format-check-target)
endmacro()

macro(enable_c_verify_clang_format_fix)
  add_custom_target(c-verify-clang-format-fix-target)
  c_verify_fix(c-verify-clang-format-fix-target)
endmacro()

macro(enable_c_verify_clang_format)
  enable_c_verify_clang_format_check()
  enable_c_verify_clang_format_fix()
endmacro()
