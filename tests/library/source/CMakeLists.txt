add_library(hello hello.c)
c_verify_clang_tidy(hello)
c_verify_clang_format(hello)
