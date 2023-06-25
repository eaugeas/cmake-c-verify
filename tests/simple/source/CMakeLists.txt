add_executable(simple main.c)
target_link_libraries(simple hello)

add_dependencies(simple library)

c_verify_clang_tidy(source)
c_verify_clang_format(source)
