# CMake C Verify
Simple cmake configuration files to enable basic source code checking and linting

## Features
It currently enables the use of clang-tidy and clang-format for the source code files.

## How to enable
It can be enabled by calling the macros in the project's cmake file

```cmake
enable_c_verify()
enable_c_verify_clang_tidy()
enable_c_verify_clang_format()
```

and adding a source folder from the source folder's cmake file

```cmake
c_verify_clang_tidy(folder_name)
c_verify_clang_format(folder_name)
```
