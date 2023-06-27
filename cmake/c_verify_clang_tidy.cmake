find_program(CLANG_TIDY "clang-tidy")
if(NOT CLANG_TIDY)
  macro(c_verify_clang_tidy_check name)
  endmacro()

  macro(c_verify_clang_tidy_fix name)
  endmacro()

  macro(c_verify_clang_tidy name)
  endmacro()

  macro(enable_c_verify_clang_tidy_check)
    message(WARNING "clang-tidy not found")
  endmacro()

  macro(enable_c_verify_clang_tidy_fix)
    message(WARNING "clang-tidy not found")
  endmacro()

  macro(enable_c_verify_clang_tidy)
    enable_c_verify_clang_tidy_check()
    enable_c_verify_clang_tidy_fix()
  endmacro()

  return()
endif()

include(${CMAKE_CURRENT_LIST_DIR}/c_verify.cmake)

macro(c_verify_clang_tidy_check name)
  add_custom_target(c-verify-clang-tidy-check-${name}-target)
  c_verify_are_source_files_present(are_source_files_present ${CMAKE_CURRENT_SOURCE_DIR})
  c_verify_are_header_files_present(are_header_files_present ${CMAKE_CURRENT_SOURCE_DIR})
  set(C_VERIFY_CLANG_TIDY_EXTRA_PARAMETERS "")

  if (${C_VERIFY_CLANG_TIDY_INCLUDES})
    set(C_VERIFY_CLANG_TIDY_EXTRA_PARAMETERS "-- ${C_VERIFY_CLANG_TIDY_INCLUDES}")
  endif()

  if (are_source_files_present)
    add_custom_target(c-verify-clang-tidy-check-sources-${name}-target
      COMMAND clang-tidy ${CMAKE_CURRENT_SOURCE_DIR}/*.c ${C_VERIFY_CLANG_TIDY_EXTRA_PARAMETERS})
    add_dependencies(c-verify-clang-tidy-check-${name}-target c-verify-clang-tidy-check-sources-${name}-target)
  endif()

  if (are_header_files_present)
    add_custom_target(c-verify-clang-tidy-check-headers-${name}-target
      COMMAND clang-tidy ${CMAKE_CURRENT_SOURCE_DIR}/*.h ${C_VERIFY_CLANG_TIDY_EXTRA_PARAMETERS})
    add_dependencies(c-verify-clang-tidy-check-${name}-target c-verify-clang-tidy-check-headers-${name}-target)
  endif()

  add_dependencies(c-verify-clang-tidy-check-target c-verify-clang-tidy-check-${name}-target)
endmacro()

macro(c_verify_clang_tidy_fix name)
  add_custom_target(c-verify-clang-tidy-fix-${name}-target)
  c_verify_are_source_files_present(are_source_files_present ${CMAKE_CURRENT_SOURCE_DIR})
  c_verify_are_header_files_present(are_header_files_present ${CMAKE_CURRENT_SOURCE_DIR})

  if (are_source_files_present)
    add_custom_target(c-verify-clang-tidy-fix-sources-${name}-target
      COMMAND clang-tidy --fix --fix-errors ${CMAKE_CURRENT_SOURCE_DIR}/*.c)
    add_dependencies(c-verify-clang-tidy-fix-${name}-target c-verify-clang-tidy-fix-sources-${name}-target)
  endif()

  if (are_header_files_present)
    add_custom_target(c-verify-clang-tidy-fix-headers-${name}-target
      COMMAND clang-tidy --fix --fix-errors ${CMAKE_CURRENT_SOURCE_DIR}/*.h)
    add_dependencies(c-verify-clang-tidy-fix-${name}-target c-verify-clang-tidy-fix-headers-${name}-target)
  endif()

  add_dependencies(c-verify-clang-tidy-fix-target c-verify-clang-tidy-fix-${name}-target)
endmacro()

macro(c_verify_clang_tidy name)
  c_verify_clang_tidy_check(${name})
  c_verify_clang_tidy_fix(${name})
endmacro()

macro(enable_c_verify_clang_tidy_check)
  add_custom_target(c-verify-clang-tidy-check-target)
  c_verify_check(c-verify-clang-tidy-check-target)
endmacro()

macro(enable_c_verify_clang_tidy_fix)
  add_custom_target(c-verify-clang-tidy-fix-target)
  c_verify_fix(c-verify-clang-tidy-fix-target)
endmacro()

macro(enable_c_verify_clang_tidy)
  enable_c_verify_clang_tidy_check()
  enable_c_verify_clang_tidy_fix()
endmacro()
