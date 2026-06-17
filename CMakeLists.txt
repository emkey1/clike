# clike — a C-like front end for the PSCAL VM.
#
# Parses C-like source into the shared PSCAL AST and runs it on pscal-core's VM.
# Pulls pscal-core in via FetchContent, so building this repo on its own fetches
# and builds the shared core automatically.
cmake_minimum_required(VERSION 3.18)
project(clike C)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
add_compile_options(-Wall)
if(UNIX AND NOT APPLE)
    add_compile_definitions(_GNU_SOURCE _POSIX_C_SOURCE=200809L)
endif()
if(CMAKE_C_COMPILER_ID STREQUAL "AppleClang")
    add_compile_options(-Wno-nullability-completeness)
endif()

find_package(Threads REQUIRED)

include(FetchContent)
FetchContent_Declare(
    pscal_core
    GIT_REPOSITORY https://github.com/emkey1/pscal-core.git
    GIT_TAG main
)
FetchContent_MakeAvailable(pscal_core)

# Core public headers + the generated pscal_paths.h (configure_file in core writes
# it under the top-level binary dir), plus CLike's own headers.
include_directories(
    ${pscal_core_SOURCE_DIR}/src
    ${pscal_core_SOURCE_DIR}/src/third_party/yyjson
    ${CMAKE_BINARY_DIR}/generated
    ${CMAKE_CURRENT_SOURCE_DIR}/src
)

add_compile_definitions(
    PROGRAM_VERSION="0.0.0"
    PSCAL_GIT_TAG="untagged"
    ENABLE_EXT_BUILTIN_MATH ENABLE_EXT_BUILTIN_STRINGS ENABLE_EXT_BUILTIN_SYSTEM
    ENABLE_EXT_BUILTIN_USER ENABLE_EXT_BUILTIN_YYJSON ENABLE_EXT_BUILTIN_3D
    ENABLE_EXT_BUILTIN_GRAPHICS
)

set(CLIKE_SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/src/clike/main.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/clike/lexer.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/clike/parser.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/clike/ast.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/clike/builtins.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/clike/builtins/thread.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/clike/semantics.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/clike/translate.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/clike/opt.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/clike/preproc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/clike/state.c
)

add_executable(clike ${CLIKE_SOURCES})
target_link_libraries(clike PRIVATE pscal_core_static Threads::Threads m)
